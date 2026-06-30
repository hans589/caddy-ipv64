# Phase 1: Bauen der Caddy-Binary mit dem offiziellen IPv64-Modul
FROM caddy:2-builder AS builder

RUN xcaddy build --with github.com/caddy-dns/ipv64net

# Phase 2: Das fertige Caddy in das offizielle Image packen
FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
