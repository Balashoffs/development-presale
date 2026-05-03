#!/usr/bin/env bash
# Включает сайт в хостовом nginx (режим A) и выдаёт SSL через certbot --nginx.
# Идемпотентен.
#
# Usage (на VPS):
#   sudo bash enable-site.sh <domain> <email> <upstream_port>
#
# Example:
#   sudo bash enable-site.sh example.com example@com 8081

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Запустите через sudo: sudo bash $0 ..." >&2
  exit 1
fi

DOMAIN="${1:?Первый аргумент — домен (например, example.com)}"
EMAIL="${2:?Второй аргумент — email для Lets Encrypt}"
UPSTREAM_PORT="${3:?Третий аргумент — порт docker-контейнера на хосте (например, 8081)}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE="${SCRIPT_DIR}/example.com.example"
TARGET="/etc/nginx/sites-available/${DOMAIN}.conf"
LINK="/etc/nginx/sites-enabled/${DOMAIN}.conf"

if [[ ! -f "$TEMPLATE" ]]; then
  echo "Шаблон не найден: $TEMPLATE" >&2
  exit 2
fi

say() { printf '\033[1;34m▶ %s\033[0m\n' "$*"; }

say "Проверяем доступность апстрима 127.0.0.1:${UPSTREAM_PORT}"
if ! curl -sf -o /dev/null -m 5 "http://127.0.0.1:${UPSTREAM_PORT}/"; then
  echo "ВНИМАНИЕ: апстрим http://127.0.0.1:${UPSTREAM_PORT} не отвечает." >&2
  echo "Убедитесь, что Docker контейнер запущен (./deploy.sh с локальной машины)." >&2
  echo "Продолжаем — возможно, контейнер вернёт 200 после старта." >&2
fi

say "Генерируем конфиг ${TARGET}"
sed \
  -e "s/__DOMAIN__/${DOMAIN}/g" \
  -e "s/__UPSTREAM_PORT__/${UPSTREAM_PORT}/g" \
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
