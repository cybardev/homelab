# Alpine Homelab

Minimal server setup on [Alpine Linux](https://www.alpinelinux.org/) with [containerd](https://github.com/containerd/containerd)

> [!NOTE]
> OS setup can be found in [etc/](./etc)

## Usage
- replace [`/etc/apk/world`](./system/etc/apk/world) and [`/etc/apk/repositories`](./system/etc/apk/repositories)
- run `doas apk upgrade -U`
- clone this repository
- `cd` into cloned repository
- rename `example.env` files in each service directory to `.env`
- edit `.env` files with appropriate values
  - _Note_: passkeys can be generated using `openssl rand -hex 32`
- run `doas nerdctl compose up -d` in repository root

## Services
- [x] [Cy | bot](https://github.com/cybardev/cybarbot)
- [x] [Forgejo](https://forgejo.org/)
- [x] [SearXNG](https://docs.searxng.org/)
- [x] [Nextcloud](https://nextcloud.com/)
- [x] [Vaultwarden](https://github.com/dani-garcia/vaultwarden)
- [ ] [Ente](https://ente.io/)
- [ ] [Continuwuity](https://continuwuity.org/)

## Internal
- [Valkey](https://valkey.io/)
- [PostgreSQL](https://www.postgresql.org/)
- [Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/)
  - `TODO`: replace with [Caddy](https://github.com/searxng/searxng-docker/blob/master/docker-compose.yaml) and/or [Tailscale](https://tailscale.com/)+[Headscale](https://github.com/juanfont/headscale)

## Credits
- [searxng/searxng-docker](https://github.com/searxng/searxng-docker)
- [nextcloud/docker](https://github.com/nextcloud/docker)
- [Forgejo docs](https://forgejo.org/docs/latest/admin/installation/docker/#postgresql-database)
- [jonas-merkle/container-cloudflare-tunnel](https://github.com/jonas-merkle/container-cloudflare-tunnel)
- [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [Vaultwarden Wiki: Using Docker Compose](https://github.com/dani-garcia/vaultwarden/wiki/Using-Docker-Compose)
- [Ente docs: Self-hosting > Docker Compose](https://ente.io/help/self-hosting/installation/compose)
- [Continuwuity docs: Docker](https://continuwuity.org/deploying/docker.html#for-other-reverse-proxies)
