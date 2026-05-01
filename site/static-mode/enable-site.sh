#!/usr/bin/env bash
# Включает сайт в хостовом nginx (режим B — статика) и выдаёт SSL через certbot --nginx.
# Идемпотентен.
#
# Usage (на VPS):
#   sudo bash enable-site.sh <domain> <email> [webroot]
#
# Example:
#   sudo bash enable-site.sh frog.hello-vanilla.ru admin@example.com /var/www/konex

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Запустите через sudo: sudo bash $0 ..." >&2
  exit 1
fi

DOMAIN="${1:?Первый аргумент — домен}"
EMAIL="${2:?Второй аргумент — email для Lets Encrypt}"
WEBROOT="${3:-/var/www/konex}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE="${SCRIPT_DIR}/konex.conf.example"
TARGET="/etc/nginx/sites-available/${DOMAIN}.conf"
LINK="/etc/nginx/sites-enabled/${DOMAIN}.conf"

if [[ ! -f "$TEMPLATE" ]]; then
  echo "Шаблон не найден: $TEMPLATE" >&2
  exit 2
fi

if [[ ! -d "$WEBROOT" ]]; then
  echo "Webroot не существует: $WEBROOT" >&2
  echo "Запустите сначала deploy-host-setup.sh" >&2
  exit 3
fi

say() { printf '\033[1;34m▶ %s\033[0m\n' "$*"; }

# sed escape для путей со слешами (например /var/www/konex)
WEBROOT_ESC="$(printf '%s\n' "$WEBROOT" | sed 's/[\/&]/\\&/g')"

say "Генерируем конфиг ${TARGET}"
sed \
  -e "s/__DOMAIN__/${DOMAIN}/g" \
  -e "s/__WEBROOT__/${WEBROOT_ESC}/g" \
  "$TEMPLATE" > "$TARGET"

say "Включаем сайт (симлинк в sites-enabled)"
ln -sf "$TARGET" "$LINK"

say "Проверяем синтаксис nginx"
nginx -t

say "Перезагружаем nginx"
systemctl reload nginx

say "Запрашиваем SSL-сертификат через certbot --nginx"
certbot --nginx \
  -d "${DOMAIN}" \
  -m "${EMAIL}" \
  --agree-tos \
  --redirect \
  --no-eff-email \
  -n

say "Финальный тест и перезагрузка"
nginx -t
systemctl reload nginx

say "Готово. Сайт доступен по https://${DOMAIN}"
