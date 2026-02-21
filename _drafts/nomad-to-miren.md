---
title: "Migrating My Homelab from Nomad to Miren"
slug:  nomad-to-miren
date:  2026-02-15
listed: true
---

For the last few years, my personal infrastructure has run on a pretty standard HashiCorp stack: a single Nomad node (`hashi01`) running a handful of services behind Traefik, all wired together with Terraform and Tailscale. It's been fine. It works. But "fine" is a funny word when you're building something that's supposed to be better.

I work on [Miren](https://miren.dev), so it was past time to eat my own cooking. This weekend I migrated everything off Nomad and onto a fresh Miren server. Here's how it went.

### The Setup

My homelab is modest. A Proxmox box running VMs, Tailscale connecting everything, DNSimple for DNS. The services are the kind of stuff you'd expect from someone who wants to self-host their way out of the ad-supported internet: [Miniflux](https://miniflux.app/) for RSS, [Redlib](https://github.com/redlib-org/redlib) as a Reddit frontend, [Nitter](https://github.com/zedeus/nitter) for Twitter, plus a few others.

On Nomad, each service was a `.nomad` job file with HCL templates, Nomad variables for secrets, and Traefik tags for routing. It worked, but there was a lot of ceremony. Want to add a service? Write 80 lines of HCL, configure Traefik labels, set up Nomad variables, hope the template rendering does what you think it does.

### Provisioning

I already had a Terraform module for spinning up Proxmox VMs with cloud-init and Tailscale baked in, so standing up `miren01` was just adding another module call:

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

`terraform apply`, SSH in, install Miren, done. The DNS wildcard (`*.inze.ph`) was already managed by Terraform, so cutting it over to the new VM later would be a one-line change.

One thing I did need to set up manually: the ACME DNS challenge for TLS certificates. My server is only reachable over Tailscale, so HTTP challenges won't work. Miren uses [lego](https://go-acme.github.io/lego/) under the hood, so I pointed it at DNSimple and it Just Worked.

### The Tracer Bullet

I always start with [whoami](https://github.com/traefik/whoami). It's the tracer bullet for "can I deploy a thing and reach it over HTTPS?"

The entire app definition:

```toml
# .miren/app.toml
name = "whoami"

[services.web]
port = 80

[services.web.concurrency]
mode = "fixed"
num_instances = 1
```

```dockerfile
# Dockerfile.miren
FROM traefik/whoami
EXPOSE 80
```

`miren deploy`, set a route, `curl` it. Working. That felt good. Two files instead of an 80-line Nomad job.

### The Easy Ones

Redlib was next. Stateless, single container, one env var. Took about two minutes. Miniflux was slightly more interesting because it needs Postgres. In Miren, you just add another service to the same app:

```toml
[services.postgres]
image = "postgres:15"

[[services.postgres.env]]
key = "POSTGRES_DB"
value = "miniflux"
```

Postgres gets internal DNS at `postgres.app.miren` and persistent storage automatically. No separate job, no Consul service discovery, no volume stanza. The DATABASE_URL just points at the sidecar and it works.

### The Hard One

Then came Nitter. This is where I actually learned something.

Nitter is quirky software. It reads config from a file (`nitter.conf`) in the current working directory. It reads OAuth sessions from `sessions.jsonl`, also relative to the CWD. On Nomad, I handled this with template blocks that rendered Nomad variables into files before the process started. Clean enough.

On Miren, I tried to do the equivalent: set secrets as env vars, write an entrypoint script to bridge them into files at runtime. The config file part worked. The sessions file... didn't. I'd write it, verify the contents looked correct, and nitter would report reading an empty file. Maddening.

After a bunch of debugging, I discovered the root cause was simpler than I expected: **Miren wasn't respecting the Dockerfile `WORKDIR` directive**. Nitter uses relative paths for everything (`./nitter.conf`, `./sessions.jsonl`), so when the process started in a different directory than I specified, it couldn't find its files. Once I added an explicit `cd /src` in the entrypoint, everything clicked.

### The Bugs You Want to Find

This is exactly the kind of thing dogfooding is for. I filed two issues:

1. **WORKDIR should be respected.** If the Dockerfile says `WORKDIR /src`, the process should start there. Standard Docker behavior.

2. **Secret files, not just env vars.** Lots of software reads config from files. Having a first-class way to mount an env var value as a file (like Nomad templates or Kubernetes secret mounts) would eliminate the whole entrypoint-script-as-glue pattern.

I also filed a couple of issues earlier in the process about error messages that could be clearer. The kind of papercuts you only find when you're actually using the thing under real conditions, not just running the happy path in a demo.

### The Cutover

With all three priority services running and verified on `miren01`, the DNS cutover was anticlimactic. One Terraform change to point the wildcard at the new IP:

```hcl
resource "dnsimple_zone_record" "services_wildcard" {
  zone_name = var.domain
  name      = "*"
  value     = local.miren01_ip  # was hashi01_ip
  type      = "A"
  ttl       = 3600
}
```

`terraform apply`, wait for TTLs, done. Everything live on the new stack.

### Impressions

The thing that stands out is how much less _stuff_ there is. A Nomad job for a simple web service is 60-80 lines of HCL with groups, tasks, templates, service blocks, tags, and check stanzas. The Miren equivalent is a 10-line TOML file and a 2-line Dockerfile. There's less to get wrong.

The sidecar model is particularly nice. On Nomad, Postgres and Redis were separate jobs with their own lifecycle, their own service registrations, their own health checks. On Miren, they're just services in the same app with automatic internal DNS. It matches how I actually think about these things: miniflux _has_ a database, it's not a peer of its database.

There's still rough edges. The WORKDIR thing. The secret files gap. Some error messages that could be more helpful. But that's the whole point of doing this---you don't find the real issues until you put real workloads on it.

`hashi01` is still running. I'll decommission it once I've migrated the remaining services. But for the stuff I actually use every day---my RSS reader, my Reddit and Twitter frontends---it's all on Miren now. And it took an afternoon.
