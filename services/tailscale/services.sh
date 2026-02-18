#!/bin/sh
tailscale serve --service=svc:glances --https=443 127.0.0.1:61208
tailscale serve --service=svc:vault --https=443 127.0.0.1:9999
tailscale serve --service=svc:drive --https=443 127.0.0.1:5212
tailscale serve --service=svc:search --https=443 127.0.0.1:8888
tailscale serve --service=svc:radicale --https=443 127.0.0.1:5232
tailscale serve --service=svc:photos --https=443 127.0.0.1:3000
tailscale serve --service=svc:accounts-photos --https=443 127.0.0.1:3001
tailscale serve --service=svc:album-photos --https=443 127.0.0.1:3002
tailscale serve --service=svc:auth-photos --https=443 127.0.0.1:3003
tailscale serve --service=svc:cast-photos --https=443 127.0.0.1:3004
tailscale serve --service=svc:share-photos --https=443 127.0.0.1:3005
tailscale serve --service=svc:embed-photos --https=443 127.0.0.1:3006
tailscale serve --service=svc:api-photos --https=443 127.0.0.1:3223
tailscale serve --service=svc:s3-photos --https=443 127.0.0.1:3900
