#!/usr/bin/env bash
# Публикует ./dist на VPS через rsync.
# Запускать с локальной машины ПОСЛЕ npm run build.
#
# Usage:
#   ./site/static-mode/publish.sh <ssh_host> [domain] [webroot]
#
# Examples:
#   ./site/static-mode/publish.sh user@vps.example.com
#   ./site/static-mode/publish.sh user@vps.example.com frog.hello-vanilla.ru
#   ./site/static-mode/publish.sh user@vps.example.com frog.hello-vanilla.ru /var/www/konex
#
# Если webroot не указан — по умолчанию /var/www/konex.
# Domain сейчас не используется в скрипте, но оставлен в сигнатуре,
# чтобы вызов читался однозначно ("публикуем такой-то сайт на такой-то VPS").

set -euo pipefail

SSH_HOST="${1:?Первый аргумент — VPS (например, user@vps.example.com)}"
DOMAIN="${2:-}"   # необязательно
WEBROOT="${3:-/var/www/konex}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
DIST_DIR="${REPO_ROOT}/dist"

say() { printf '\033[1;34m▶ %s\033[0m\n' "$*"; }

if [[ ! -d "$DIST_DIR" ]]; then
  echo "Не найден билд: $DIST_DIR" >&2
  echo "Сначала выполните: npm run build" >&2
  exit 1
fi

say "Публикуем ${DIST_DIR}/ → ${SSH_HOST}:${WEBROOT}/"
[[ -n "$DOMAIN" ]] && say "Целевой домен: ${DOMAIN}"

# --delete удаляет на сервере файлы, которых уже нет локально (чистим старые ассеты).
# Если страшно — запустите без --delete и удаляйте вручную.
rsync -avz --delete \
  --omit-dir-times \
  --no-perms \
  "${DIST_DIR}/" \
  "${SSH_HOST}:${WEBROOT}/"

say "Готово. Проверьте сайт: https://${DOMAIN:-<domain>}/"
