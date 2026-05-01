#!/usr/bin/env bash
# Однократная настройка VPS для режима A (Docker за reverse-proxy nginx).
# Идемпотентен — можно перезапускать.
#
# Usage (на VPS):
#   sudo bash deploy-host-setup.sh [docker_user]
#
# docker_user — имя пользователя, которого нужно добавить в группу docker
# (по умолчанию — $SUDO_USER, тот, кто запустил sudo).
# Это решает ошибку "permission denied while trying to connect to the docker
# API at unix:///var/run/docker.sock", которая появляется, если SSH-юзер не
# может вызывать `docker` без sudo.

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Запустите через sudo: sudo bash $0" >&2
  exit 1
fi

DOCKER_USER="${1:-${SUDO_USER:-}}"

say() { printf '\033[1;34m▶ %s\033[0m\n' "$*"; }

say "Обновляем индекс пакетов"
apt-get update -y

say "Ставим nginx, certbot, плагин certbot-nginx и Docker"
DEBIAN_FRONTEND=noninteractive apt-get install -y \
  nginx \
  certbot \
  python3-certbot-nginx \
  ca-certificates \
  curl

# --- Docker (engine + buildx + compose plugin) ---------------------------
# Если уже стоит — пропускаем; иначе ставим официальный docker-ce из репозитория Docker.
if ! command -v docker >/dev/null 2>&1; then
  say "Устанавливаем Docker Engine"
  install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  chmod a+r /etc/apt/keyrings/docker.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
    | tee /etc/apt/sources.list.d/docker.list >/dev/null
  apt-get update -y
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
    docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  systemctl enable --now docker
fi

# --- Docker rights: ставим $DOCKER_USER в группу docker ------------------
# Без этого `docker version` от имени SSH-юзера падает с
#   "permission denied while trying to connect to the docker API at unix:///var/run/docker.sock"
if [[ -n "$DOCKER_USER" ]] && id "$DOCKER_USER" >/dev/null 2>&1; then
  if ! id -nG "$DOCKER_USER" | tr ' ' '\n' | grep -qx docker; then
    say "Добавляем пользователя ${DOCKER_USER} в группу docker"
    usermod -aG docker "$DOCKER_USER"
    DOCKER_GROUP_ADDED=1
  else
    say "Пользователь ${DOCKER_USER} уже в группе docker"
    DOCKER_GROUP_ADDED=0
  fi
else
  echo "ВНИМАНИЕ: не указан пользователь для группы docker." >&2
  echo "Передайте имя как первый аргумент: sudo bash $0 <username>" >&2
  DOCKER_GROUP_ADDED=0
fi

say "Создаём директории sites-available / sites-enabled (если их нет)"
mkdir -p /etc/nginx/sites-available /etc/nginx/sites-enabled

# Проверяем, что nginx.conf включает sites-enabled
if ! grep -qE 'include\s+/etc/nginx/sites-enabled/\*' /etc/nginx/nginx.conf; then
  say "В /etc/nginx/nginx.conf не найден include sites-enabled/* — добавляем"
  # Ищем блок http { ... } и вставляем include перед закрывающей скобкой
  if grep -q '^http {' /etc/nginx/nginx.conf; then
    sed -i '/^http {/a \    include /etc/nginx/sites-enabled/*.conf;' /etc/nginx/nginx.conf
  else
    echo "ВНИМАНИЕ: не получилось автоматически найти секцию http { в /etc/nginx/nginx.conf." >&2
    echo "Добавьте вручную: include /etc/nginx/sites-enabled/*.conf;" >&2
  fi
fi

say "Проверяем синтаксис nginx"
nginx -t

if systemctl is-active --quiet nginx; then
  say "Перезагружаем nginx"
  systemctl reload nginx
else
  say "Запускаем nginx"
  systemctl enable --now nginx
fi

# UFW (если установлен и активен)
if command -v ufw >/dev/null 2>&1 && ufw status | grep -q 'Status: active'; then
  say "Открываем порты 80 и 443 в UFW"
  ufw allow 80/tcp || true
  ufw allow 443/tcp || true
fi

say "Проверка таймера certbot (автообновление SSL)"
systemctl enable --now certbot.timer
systemctl list-timers --all | grep -i certbot || true

say "Готово. Хост готов принимать конфиги сайтов через enable-site.sh."

if (( ${DOCKER_GROUP_ADDED:-0} )); then
  echo
  echo "ВАЖНО: пользователь ${DOCKER_USER} только что добавлен в группу docker."
  echo "Чтобы изменения вступили в силу, ему нужно ПЕРЕЛОГИНИТЬСЯ в SSH-сессию"
  echo "(закрыть и открыть SSH заново). Иначе ./deploy.sh со стороны разработчика"
  echo "будет падать с 'permission denied' на /var/run/docker.sock."
fi
