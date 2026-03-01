---
title: "The Box in the Basement"
slug:  box-in-the-basement
date:  2026-02-21
listed: true
---

<!--
DRAFT NOTES (2026-03-01)

Part of a loose "My Setup" series — posts reference each other inline:
  1. The Box in the Basement (this post) — hardware, Proxmox, Tailscale, the why
  2. Dev VM post (not yet started) — foxtrotbase, SSH lifestyle, Bankshot, Double Agent
     - bankshot draft (_drafts/bankshot.md) is ~80% of this, needs framing
  3. Personal Server post (_drafts/nomad-to-miren.md) — self-hosted services, Miren
     - Detailed Miren migration could also be a cross-post on the Miren blog

Open threads:
- Bio arc (Vagrant → HashiCorp → Terraform) was deliberately kept light here.
  Could be its own post someday — "how an enemy of the state ended up building
  infrastructure tools." For now the Puppet → Homebrew Cask → Nix line is enough.
- "Enemy of the state" could be a standalone essay about the philosophy — the
  two-buckets framework (durable data vs reproducible config), the laptop-wiping
  practice, etc. Cut from this draft to keep it moving but the material is there.
- Consider open-sourcing github.com/phinze/infra to link to source. Audit done:
  main blockers are hardcoded secrets in nomad-jobs/traefik.nomad (DNSimple token),
  miren-apps/nitter/sessions.jsonl (Twitter OAuth), and some DB passwords in
  nomad/miren app configs. Needs credential rotation + extraction to env vars.
- De-LLM-ify pass still needed — watch for tricolons, structural announcements,
  punchy declarative closers.
- Mitchell Hashimoto link needs verification — used mitchellh.com/writing/nix-darwin-setup
  but should confirm that's the right URL.
-->

For as long as I've been using computers, I've had this persistent low-grade anxiety about machine state. The more stuff accumulates on a system that I can't account for, the itchier I get. I've come to call this feeling — in one of those jokes you make in your own head that you're not sure actually lands out loud — "enemy of the state." For years I dealt with it by wiping my laptop every few months just to prove I could set it all back up from scratch. If the setup procedure wasn't automated, it wasn't real to me. It was just a house of cards that happened to still be standing.

Naturally this pushed me toward automation. What started as setup notes in a text file became shell scripts, which led me to [Puppet](https://puppet.com/), which got me interested enough in the problem that I built [Homebrew Cask](https://github.com/Homebrew/homebrew-cask) so `brew install` could handle Mac apps too. The same instinct pointed me toward infrastructure as code more broadly, and eventually I ended up deep in [Nix](https://nixos.org/), which is more or less the end of the road for this particular compulsion. Nix has its rough edges, but it lets me define everything about a system declaratively and rebuild it from a git repo.

I found Nix so satisfying that I followed [Mitchell Hashimoto's lead](https://mitchellh.com/writing/nix-darwin-setup) and went all in on living my entire dev life inside a NixOS VM on my Mac. I started by forking his config, but diverged pretty quickly — I preferred SSH and tmux sessions over graphical mode, which changed enough of the setup that I eventually ported from scratch based on a clean starter config I liked. The result was my [nix-config](https://github.com/phinze/nix-config) repo, and the big VM that lived on my laptop I called "echobase," because look, you have to allow me a cliched Star Wars reference now and again.

This worked well for a while. But since I was already living in a VM full time, I got curious about leaning further into it. What if I took for granted that I almost always have a network connection and got some serious iron to run the VM on? More of a mainframe situation — a thin laptop as a terminal to a real machine somewhere else. That's what led to the box in the basement.

### The hardware

I set up a Craigslist saved search for "server" and waited. Turns out that keyword gets you a lot of restaurant equipment — big serving plates, credenzas, that kind of thing. But eventually I hit the jackpot: a decommissioned workstation with a Xeon Platinum 8275CL (24 cores), 192GB of RAM, and a reasonable asking price. Talked the seller down to $1,800 and met him in a police station parking lot to exchange cash for server hardware. Added a 2TB NVMe drive, installed [Proxmox](https://www.proxmox.com/), and eventually moved it into a rackmount case.

Plugging it in and firing up `htop` for the first time was a moment. 48 logical CPUs with hyperthreading, 187GB of usable RAM. Just a stupid amount of computer for $1,800.

TODO: htop screenshot

TODO: rework this paragraph — economics, power/solar, overpowered-and-that's-the-point

That's the whole fleet. No monthly bills, no instance types to pick, no egress charges. (There's a power bill, which I haven't tracked carefully — but between rooftop solar and a community solar subscription, the electricity is at least coming from green sources.) The machine is comically overpowered for what I'm doing, but I'd rather have too much headroom than think about resources ever again.

### VMs

Proxmox gives me a hypervisor that stays out of the way. I maintain two VM templates — one NixOS, one Ubuntu cloud image — and a small Terraform module that stamps out new VMs from them. A new VM is a paragraph of HCL:

```hcl
module "miren01" {
  source      = "./modules/proxmox-vm"
  name        = "miren01"
  template    = "ubuntu-2404"
  clone_vm_id = 9000
  vm_id       = 108
  cores       = 4
  memory      = 8 * 1024
  disk_size   = "100G"
}
```

`terraform apply` and it exists. Cloned from a template, cloud-init runs, Tailscale joins. The NixOS VMs get their full config from a flake in my [nix-config](https://github.com/phinze/nix-config) repo. The Ubuntu ones get cloud-init and then whatever they need on top.

Right now there are three VMs running:

- **foxtrotbase** — my primary dev environment. NixOS, 24 cores, 32GB RAM. I SSH in from my laptop and this is where I spend my working day. (I'll write more about this setup separately.)
- **miren01** — my personal server. Runs self-hosted services behind [Miren](https://miren.dev). (Also its own post.)
- **hashi01** — the old Nomad node. Still running a few things. On its way out.

Having a machine where I can launch arbitrary VMs scratches the same reproducibility itch that wiping my laptop used to. Each VM is isolated — I can tear one down and rebuild it and nothing else is affected. But there's a bonus that a laptop could never give me: persistence. I close my laptop and walk away and everything keeps running. Services stay up, long builds finish, dev servers keep serving.

### Tailscale

[Tailscale](https://tailscale.com/) is what makes this whole thing feel normal instead of like a chore. Every VM boots onto my tailnet automatically via cloud-init. They're behind NAT, unreachable from the public internet — if you're on my tailnet you can reach them, and otherwise they just don't exist. I don't think about firewalls. I don't think about securing exposed ports. There's nothing to secure because there's nothing exposed.

DNS is automated too — Terraform reads my Tailscale device list and generates `{hostname}.versa.inze.ph` records plus wildcards for each one. Every VM gets a real hostname and a TLS certificate without me touching anything.

### What it adds up to

The day-to-day of this setup is pretty unremarkable, which is the best thing I can say about it. I open my laptop, SSH into foxtrotbase, and I'm in my dev environment. Miniflux has been collecting RSS feeds overnight. Redlib is there when I want to browse Reddit without the algorithmic feed. If I want to spin up something new — try a self-hosted app, prototype a weekend project — I have a place to put it that's already wired up with DNS and TLS and accessible from all my devices.

All of it runs on a machine I bought from a stranger in a parking lot four years ago. I don't think about the infrastructure much anymore. For someone who spent years obsessively proving they could rebuild everything from scratch, not having to think about it is the whole point.
