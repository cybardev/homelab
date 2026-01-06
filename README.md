# Alpine Homelab

Minimal server setup on [Alpine Linux](https://www.alpinelinux.org/) with [containerd](https://github.com/containerd/containerd)

> [!NOTE]
> OS setup can be found in [etc/](./etc)

## Usage
- replace [`/etc/apk/world`](./etc/apk/world) and [`/etc/apk/repositories`](./etc/apk/repositories)
- run `doas apk upgrade -U`
- clone this repository
- `cd` into cloned repository
- run `cp example.env .env`
- edit `.env` file with appropriate values
  - _Note_: passkeys can be generated using `openssl rand -hex 32`
- run `doas nerdctl compose up -d`

## Services
- [SearXNG](https://docs.searxng.org/)
- [Nextcloud](https://nextcloud.com/)
- [Forgejo](https://forgejo.org/)
- [Cy | bot](https://github.com/cybardev/cybarbot)

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
- [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
