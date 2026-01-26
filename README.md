# Alpine Homelab

Minimal server setup on [Alpine Linux](https://www.alpinelinux.org/) with [containerd](https://github.com/containerd/containerd)

> [!NOTE]
> OS setup can be found in [system/](./system)

## Usage
- replace [`/etc/apk/world`](./system/etc/apk/world) and [`/etc/apk/repositories`](./system/etc/apk/repositories)
- run `doas apk upgrade -U`
- clone this repository
- `cd` into cloned repository
- rename `example.env` files in each service directory to `.env`
- edit `.env` files with appropriate values
- set up Radicale authentication file [as described here](https://radicale.org/v3.html#the-secure-way)
- run `doas nerdctl compose up -d` in repository root

### Extras
- passkeys can be generated using `openssl rand -hex 32`
- extra setup may be needed for some services (e.g. `museum.secret.yaml` for Ente, `keys.secret.json` for Cobalt, etc.). Instructions for each service can be inferred from its respective compose file, adjacent `example` files, as well as docs linked in [References](#References)
- for Tailscale services, add them via Admin console, then run `doas nerdctl exec -it tailscale ts-services.sh`
- for Ente, run the following SQL ([found from here](https://github.com/ente-io/ente/discussions/729#discussioncomment-8781863)) on the SQL DB in the `ente-db` container (replace the number with however many `bytes` you want the user to have; example shows 256 GiB):
  ```pgsql
  INSERT INTO storage_bonus (bonus_id, user_id, storage, type, valid_till) VALUES ('self-hosted', (SELECT user_id FROM users LIMIT 1), 274877906944, 'ADD_ON_SUPPORT', 0)
  ```

## Services

> [!NOTE]
> The checkbox indicates compose files for the service has been added to the repository. However, it may be `inactive` in my setup and can be activated by uncommenting the corresponding line in the main [compose.yaml](./compose.yaml) file.

- [x] [Cy | bot](https://github.com/cybardev/cybarbot) — Discord bot
- [x] [Forgejo](https://forgejo.org/) — git remote frontend
- [x] [SearXNG](https://docs.searxng.org/) — (meta)search engine
- [x] [Vaultwarden](https://github.com/dani-garcia/vaultwarden) — authentication manager
- [x] [Cloudreve](https://cloudreve.org/) — cloud storage
- [x] [Radicale](https://radicale.org/master.html) — calendar/contacts sync
- [x] [Cobalt](https://github.com/imputnet/cobalt) — media downloader
- [x] [Ente](https://ente.io/) — encrypted photo cloud
- [x] [4get](https://git.lolcat.ca/lolcat/4get) — (meta)search engine
- [ ] [Continuwuity](https://continuwuity.org/) — Matrix homeserver

## Internals
- [Valkey](https://valkey.io/)
- [PostgreSQL](https://www.postgresql.org/)
- [Tailscale](https://tailscale.com/)
  - `TODO`: use [Headscale](https://github.com/juanfont/headscale)
  - `TODO`: use reverse proxy and/or dynamic DNS for custom domain

## References
- [searxng/searxng-docker](https://github.com/searxng/searxng-docker)
- [Cloudreve docs > Deploy with Docker Compose](https://docs.cloudreve.org/en/overview/deploy/docker-compose)
- [OpenCloud Radicale container](https://github.com/opencloud-eu/opencloud-compose/blob/a0d5196dfa4367138fdffa1050cc2bbd13f2e41a/radicale/radicale.yml)
- [Forgejo docs](https://forgejo.org/docs/latest/admin/installation/docker/#postgresql-database)
- [jonas-merkle/container-cloudflare-tunnel](https://github.com/jonas-merkle/container-cloudflare-tunnel)
- [Vaultwarden Wiki: Using Docker Compose](https://github.com/dani-garcia/vaultwarden/wiki/Using-Docker-Compose)
- [Ente docs: Self-hosting > Docker Compose](https://ente.io/help/self-hosting/installation/compose)
- [Garage docs > Ente](https://git.deuxfleurs.fr/Deuxfleurs/garage/src/commit/60eee993b4e424d3e83fdd5d008a19bb04d5bcbd/doc/book/connect/apps/index.md#ente)
- [Garage docs > AWS CLI](https://git.deuxfleurs.fr/Deuxfleurs/garage/src/commit/60eee993b4e424d3e83fdd5d008a19bb04d5bcbd/doc/book/quick-start/_index.md#uploading-and-downloading-from-garage)
- [Continuwuity docs: Docker](https://continuwuity.org/deploying/docker.html#for-other-reverse-proxies)
- [Cobalt docs > run an instance](https://github.com/imputnet/cobalt/blob/8d9bccc4fedabb6842fab71bd14e805f1ea21336/docs/run-an-instance.md)
- [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
