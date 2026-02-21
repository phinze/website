---
title: "eBPF and the Systemd User Namespace Trap"
slug:  ebpf-systemd-user-namespace
date:  2026-02-13
listed: true
---

I recently added eBPF-based port monitoring to [Bankshot](/writing/bankshot), a tool I built for automatic SSH port forwarding in remote dev environments. The daemon runs as a systemd user service, managed by home-manager on NixOS. Getting eBPF working in that context required peeling through five layers of problems---one of which I haven't seen documented anywhere.

## The setup

On NixOS, capabilities are granted via `security.wrappers`---a setuid helper that sets ambient capabilities then execs the real binary. In theory, you hand the binary `CAP_BPF` and `CAP_PERFMON`, and eBPF just works.

In practice: no.

## The quick fixes

Adding cilium/ebpf changed the Go module checksums, which invalidated the Nix `vendorHash`. Boring but necessary.

Once BPF programs were loading successfully, tracepoint attachment failed because the tracefs event ID files (`/sys/kernel/tracing/events/sock/inet_sock_set_state/id`) are `0440 root:root`. Fix: add `CAP_DAC_READ_SEARCH` to the capability wrapper.

Then the memlock saga. cilium/ebpf tries to call `setrlimit(RLIMIT_MEMLOCK, infinity)` as a startup probe. Setting `LimitMEMLOCK=infinity` on the unit file didn't help, because the user systemd instance itself (`user@1000.service`) had a hard memlock limit of 8MB. A child service can't exceed its parent's hard limit. Fix: set `LimitMEMLOCK=infinity` on `user@` at the NixOS system level.

But the real one was the namespace gotcha.

## The silent namespace trap

The service had `ProtectSystem=strict` for security hardening. Sensible default. With it enabled, `bpf(BPF_MAP_CREATE)` returned `EPERM` even though the process had `CAP_BPF` in its effective set. I confirmed the capability was there with `getpcaps`. The kernel just didn't care.

Here's why. User systemd instances don't have `CAP_SYS_ADMIN`. They can't create mount namespaces directly. So when you use _any_ mount-namespace feature---`ProtectSystem`, `PrivateTmp`, `ProtectHome`---systemd quietly uses `CLONE_NEWUSER | CLONE_NEWNS` to get the mount namespace unprivileged. This puts the process in a **non-init user namespace**.

The kernel's `bpf_capable()` check requires `CAP_BPF` in the **init** user namespace. Capabilities in a child user namespace don't count. So the process has the right capability, the process status confirms it, but the kernel ignores it because it's in the wrong namespace.

I found it by comparing `/proc/PID/ns/user` between the working and broken cases:

```
Without ProtectSystem:     user:[4026531837]  (init namespace) — BPF works
With ProtectSystem=strict: user:[4026532529]  (different)      — BPF blocked
```

This isn't a configuration issue. It's a structural constraint. Any eBPF workload in a systemd user service is fundamentally incompatible with mount-namespace sandboxing, because user systemd instances _must_ use `CLONE_NEWUSER` to get `CLONE_NEWNS`. Even `PrivateTmp=true` alone triggers it.

The fix is to disable those sandbox options when eBPF mode is active. Not ideal, but there's no way around it without running the service as a system service instead.

## The final configuration

**NixOS system level:**
- `security.wrappers.bankshot` with `cap_bpf,cap_perfmon,cap_dac_read_search=ep`
- `systemd.services."user@".serviceConfig.LimitMEMLOCK = "infinity"`

**Home-manager user level:**
- `ExecStart=/run/wrappers/bin/bankshot daemon run ...`
- `LimitMEMLOCK=infinity`
- No `ProtectSystem`, `PrivateTmp`, or `ProtectHome`

## The thing worth knowing

The namespace gotcha is the kind of problem that wastes hours because everything _looks_ correct. Your process has the capability. `getpcaps` says so. But the kernel has a different definition of "has the capability" than userspace tooling suggests, and nothing in the error message (`EPERM`) points you toward namespaces as the cause.

If you're trying to run eBPF in a systemd user service and hitting unexplained permission errors: check `/proc/PID/ns/user`. If it's not the init namespace, that's your answer. And if you're using any mount-namespace sandboxing in the unit file, that's why.
