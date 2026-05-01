#!/usr/bin/env bash
# Однократная настройка VPS для режима B (статика через хостовый nginx).
# Идемпотентен.
#
# Usage (на VPS):
#   sudo bash deploy-host-setup.sh [webroot]
#
# webroot — необязательный, по умолчанию /var/www/konex

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Запустите через sudo: sudo bash $0" >&2
  exit 1
fi

WEBROOT="${1:-/var/www/konex}"

say() { printf '\033[1;34m▶ %s\033[0m\n' "$*"; }

say "Обновляем индекс пакетов"
apt-get update -y

say "Ставим nginx, certbot, rsync"
DEBIAN_FRONTEND=noninteractive apt-get install -y \
  nginx \
  certbot \
  python3-certbot-nginx \
  rsync

say "Создаём webroot ${WEBROOT}"
mkdir -p "$WEBROOT"
chown -R www-data:www-data "$WEBROOT"
chmod -R 755 "$WEBROOT"

# Заглушка index.html для проверки до первой публикации
if [[ ! -f "${WEBROOT}/index.html" ]]; then
  cat > "${WEBROOT}/index.html" <<'HTML'
<!doctype html>
<html><head><meta charset="utf-8"><title>Konex — placeholder</title></head>
<body><h1>Konex placeholder</h1><p>Заглушка. Запустите publish.sh, чтобы опубликовать билд.</p></body>
</html>
HTML
  chown www-data:www-data "${WEBROOT}/index.html"
fi

say "Создаём директории sites-available / sites-enabled"
mkdir -p /etc/nginx/sites-available /etc/nginx/sites-enabled

if ! grep -qE 'include\s+/etc/nginx/sites-enabled/\*' /etc/nginx/nginx.conf; then
  say "Добавляем include sites-enabled в /etc/nginx/nginx.conf"
  if grep -q '^http {' /etc/nginx/nginx.conf; then
    sed -i '/^http {/a \    include /etc/nginx/sites-enabled/*.conf;' /etc/nginx/nginx.conf
  fi
fi

say "Проверяем синтаксис nginx"
nginx -t

if systemctl is-active --quiet nginx; then
  systemctl reload nginx
else
  systemctl enable --now nginx
fi

if command -v ufw >/dev/null 2>&1 && ufw status | grep -q 'Status: active'; then
  say "Открываем порты 80 и 443 в UFW"
  ufw allow 80/tcp || true
  ufw allow 443/tcp || true
fi

say "Включаем certbot.timer для автоматического обновления SSL"
systemctl enable --now certbot.timer

say "Готово. Webroot: ${WEBROOT}. Дальше — publish.sh, затем enable-site.sh."
