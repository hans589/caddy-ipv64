# Custom Caddy with IPv64.net Plugin

Dieses Repository enthält das Setup für ein maßgeschneidertes **Caddy (v2)** Docker-Image, das das `caddy-ipv64net` DNS-Plugin enthält. Das Image wird automatisch über GitHub Actions gebaut und in der GitHub Container Registry (GHCR) veröffentlicht.

Der Hauptzweck dieses Images ist die automatische Abwicklung der Let's Encrypt / ZeroSSL ACME-DNS-Challenge für Wildcard-Zertifikate über den deutschen DynDNS-Anbieter **IPv64.net**.

---

## 🚀 Features

*   **Multi-Stage Build:** Kompiliert das offizielle Caddy-Image mit dem IPv64-Plugin via `xcaddy`.
*   **Automated Builds:** Eine GitHub Action baut das Image bei jedem Push auf den `main`-Branch sowie jeden Montag um 02:00 Uhr morgens automatisch neu, um Caddy- und Plugin-Updates mitzunehmen.
*   **Unraid-Ready:** Da das Image auf GHCR öffentlich gehostet wird, kann Unraid die Update-Prüfung nativ in der Docker-GUI durchführen.

---

## 🛠️ GitHub Container Registry (GHCR)

Das fertige Image ist öffentlich verfügbar unter:
```bash
ghcr.io/hans589/caddy-ipv64:latest

🎛️ Caddyfile Konfigurations-Beispiel
Um das IPv64-Plugin in deinem Caddyfile für Wildcard-Zertifikate zu nutzen, verwende die tls-Direktive mit der dns ipv64net Konfiguration:
*.deine-domain.ipv64.net {
    tls {
        dns ipv64net DEIN_IPV64_API_TOKEN
    }

    # Beispiel für einen internen Reverse Proxy zu einem Docker-Container
    reverse_proxy dein_container_name:port
}

🐋 Unraid Docker Template Setup
Damit Unraid visuell in der GUI anzeigt, wenn ein Update verfügbar ist, erstelle ein neues Container-Template mit folgenden Kerndaten:

Name: Caddy-IPv64

Repository: ghcr.io/hans589/caddy-ipv64:latest

Network: bridge (oder dein Custom Docker-Netzwerk)

Ports: 80 (HTTP) und 443 (HTTPS)

Pfade (Mappings):

/etc/caddy/Caddyfile -> Pfad zu deiner lokalen Caddyfile auf dem Server

/data -> Speicherort für Zertifikate und interne Caddy-Daten (z. B. unter appdata)

/config -> Speicherort für Caddy-Konfigurations-Backups
