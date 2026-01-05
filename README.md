# Alpine Homelab

Minimal server setup on [Alpine Linux](https://www.alpinelinux.org/) with [containerd](https://github.com/containerd/containerd)

> [!NOTE]
> OS setup can be found in [etc/](./etc)

## Services
- SearXNG
- Nextcloud
- Forgejo

## Internal
- Valkey
- PostgreSQL
- Cloudflare Tunnel
  - `TODO`: replace with [Caddy](https://github.com/searxng/searxng-docker/blob/master/docker-compose.yaml)

## Credits
- [searxng/searxng-docker](https://github.com/searxng/searxng-docker)
- [nextcloud/docker](https://github.com/nextcloud/docker)
- [Forgejo docs](https://forgejo.org/docs/latest/admin/installation/docker/#postgresql-database)
- [jonas-merkle/container-cloudflare-tunnel](https://github.com/jonas-merkle/container-cloudflare-tunnel)
