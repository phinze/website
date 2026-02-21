---
title: "Bankshot"
slug:  bankshot
date:  2026-02-12
listed: true
---

## Living in a remote machine

My daily dev setup is a little unusual. I spend most of my working hours SSH'd into a NixOS VM called foxtrotbase, which runs on a Proxmox host sitting in my basement---an Intel Xeon Platinum with 48 cores and 187 gigs of RAM. Tailscale connects everything. I open a terminal on my Mac, type `ssh foxtrotbase`, and that's where I live for the day.

It's a great setup. The machine is fast, the environment is declarative and reproducible (NixOS + home-manager), and I can pick up exactly where I left off from any laptop. But remote development has a few persistent paper cuts.

The big one: ports. I start a dev server on port 3000 on foxtrotbase, and I want to see it in my local browser. The usual move is `ssh -L 3000:localhost:3000 foxtrotbase`, but you have to do that manually, for every port, every time. When you're bouncing between projects that spin up different services on different ports, it's death by a thousand flags.

The other one: browsers. OAuth flows, CLI tools that want to `open` a URL, anything that assumes a local display---none of that works when you're in a remote shell. You end up copying URLs back and forth like it's 2004.

## Bankshot

So I built [Bankshot](https://github.com/phinze/bankshot).

The idea is simple: a monitor on your remote machine watches for ports opening, and a daemon on your laptop listens for instructions. When a process on foxtrotbase binds to port 3000, Bankshot detects it and automatically sets up an SSH port forward. When the process exits, the forward goes away. No manual flags, no remembering which ports are active.

The architecture is two pieces connected by a Unix socket forwarded over SSH:

```
foxtrotbase (remote)                         Mac (local)
┌──────────────┐                        ┌──────────────┐
│   bankshot   │──── ~/.bankshot.sock ──│  bankshotd   │
│   monitor    │     (SSH forwarded)    │  (daemon)    │
│              │                        │              │
│  watches     │                        │  fwds ports  │
│  ports       │                        │  opens URLs  │
└──────────────┘                        └──────────────┘
```

The SSH config is one `RemoteForward` line, and then it just works. The monitor watches the system for port binds; the daemon acts on them. As a bonus, the daemon can open URLs in your browser, which means OAuth flows and `xdg-open` calls from remote sessions do the right thing.

The config is declarative through home-manager:

```nix
programs.bankshot = {
  enable = true;
  enableXdgOpen = true;
  monitor = {
    portRanges = [{ start = 3000; end = 9999; }];
    ignoreProcesses = [ "sshd" "systemd" "ssh-agent" ];
    gracePeriod = "30s";
  };
};
```

The grace period is a nice touch in practice---if a dev server restarts, Bankshot holds the forward open for 30 seconds rather than tearing it down and re-establishing it.

## The eBPF upgrade

Until recently, Bankshot detected ports by polling `/proc/net/tcp` on a timer. Read the file, parse the hex port numbers, diff against the last read, emit events. It works, but it's polling---you're paying CPU for a busy loop, and there's always a gap between when a port opens and when you notice.

The new version uses eBPF. Instead of polling, it attaches a tracepoint to `sock/inet_sock_set_state` in the kernel. Every time a socket transitions to or from `TCP_LISTEN`, the kernel fires an event directly into Bankshot's ring buffer. Instant, edge-triggered, and basically free in terms of CPU.

The implementation uses [cilium/ebpf](https://github.com/cilium/ebpf) and a small C program that captures the event:

```c
struct port_event {
    u32 pid;
    u16 sport;
    u16 family;
    u32 old_state;
    u32 new_state;
};
```

It's a meaningful improvement. Polling every second means you might wait a full second before a forward is established. With eBPF, the forward goes up within milliseconds of the port opening. And if you're running a lot of services, you're not burning cycles parsing procfs files in a loop.

The code tries eBPF first, and falls back to polling on older kernels or when the right capabilities aren't available. Same interface either way.

Getting eBPF working inside a systemd user service on NixOS turned out to be [its own adventure](/writing/ebpf-systemd-user-namespace).
