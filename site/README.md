# Развёртывание сайта Konex на VPS (nginx + certbot)

Эта папка содержит артефакты для публикации сайта на VPS как **отдельного сайта** в составе хостового nginx (multi-site setup) с автоматическим SSL через Let's Encrypt (certbot).

Существующий `Dockerfile` / `nginx.conf` / `deploy.sh` в корне репозитория **остаются рабочими**: `Dockerfile` собирает контейнер с внутренним nginx, который слушает порт 80 внутри контейнера. Файлы здесь — только про **хостовый** nginx на VPS, который выступает либо reverse-proxy перед контейнером (режим A), либо раздаёт статику напрямую (режим B).

---

## Содержимое

```
site/
├── README.md                       # этот файл
├── spacing-audit.md                # таблица отступов между блоками на всех страницах
├── .env.deploy.dev.example         # шаблон для dev-окружения (`./deploy.sh --env=dev`)
├── .env.deploy.prod.example        # шаблон для prod-окружения (`./deploy.sh --env=prod`)
├── docker-mode/                    # режим A: reverse-proxy → docker-контейнер
│   ├── konex.conf.example
│   ├── deploy-host-setup.sh
│   └── enable-site.sh
└── static-mode/                    # режим B: nginx раздаёт статику напрямую
    ├── konex.conf.example
    ├── deploy-host-setup.sh
    ├── enable-site.sh
    └── publish.sh
```

Файлы `*.example` — **шаблоны**: заменяйте `example.com` на ваш реальный домен перед копированием.

---

## Предусловия (общие для обоих режимов)

1. VPS с Ubuntu 22.04+ (Debian 12 тоже подходит) и sudo-доступом.
2. DNS A-запись (и AAAA, если есть IPv6) для `example.com`, указывающая на IP VPS. **Проверка:** `dig +short example.com` должен вернуть IP сервера.
3. Открыты входящие порты `80` и `443` (UFW: `sudo ufw allow 80,443/tcp`).
4. Учётная запись с правом `sudo` без интерактивного пароля (или комфорт работать через `sudo -i`).

---

## Режим A — Docker за reverse-proxy nginx (рекомендуемый)

**Когда выбирать:** уже используете `deploy.sh` из корня, на VPS будут несколько разных сайтов в Docker-контейнерах, хотите централизованное логирование/SSL/правила в одном nginx.

**Архитектура:**

```
[Клиент] —HTTPS→ [хост nginx :443 SSL]—proxy_pass→ [Docker-контейнер konex-v3 :8080→80]
                                    ↑
                          certbot выдаёт сертификат
                          (через webroot или --nginx плагин)
```

### Шаги

#### 1. Однократная настройка хоста

```bash
# На VPS:
ssh user@vps
sudo bash < /tmp/deploy-host-setup.sh   # см. site/docker-mode/deploy-host-setup.sh
```

Что делает скрипт `docker-mode/deploy-host-setup.sh`:
- ставит `nginx`, `certbot`, `python3-certbot-nginx`;
- открывает порты 80/443 в UFW (если ufw активен);
- создаёт каталоги `/etc/nginx/sites-available` и `/etc/nginx/sites-enabled`, если их нет;
- проверяет, что в `/etc/nginx/nginx.conf` есть `include /etc/nginx/sites-enabled/*.conf;`.

#### 2. Запуск контейнера на VPS

С локальной машины (как сейчас):

```bash
# .env.deploy в корне репозитория:
VPS_HOST=user@vps.example.com
VPS_PORT=8081      # порт на хосте, на который мапится 80 контейнера

./deploy.sh
```

После деплоя контейнер слушает на `127.0.0.1:8081` (по умолчанию `-p ${VPS_PORT}:80`).
Проверка: `ssh user@vps 'curl -sI http://127.0.0.1:8081/ | head -1'` → должен вернуть `HTTP/1.1 200 OK`.

#### 3. Включение сайта в хостовом nginx

```bash
# С локальной машины загрузите шаблон конфига и enable-скрипт на VPS:
scp site/docker-mode/konex.conf.example user@vps:/tmp/
scp site/docker-mode/enable-site.sh    user@vps:/tmp/

# На VPS:
ssh user@vps
sudo bash /tmp/enable-site.sh koneks-dev.hello-vanilla.ru example@com 8081
```

Скрипт `enable-site.sh`:
1. Копирует шаблон в `/etc/nginx/sites-available/example.com.conf`, заменяя плейсхолдеры `__DOMAIN__` и `__UPSTREAM_PORT__`.
2. Делает симлинк в `/etc/nginx/sites-enabled/`.
3. Проверяет конфиг: `nginx -t`.
4. Перезагружает nginx: `systemctl reload nginx`.
5. Запрашивает SSL: `certbot --nginx -d example.com -m you@example.com --agree-tos --redirect -n`.

После этого certbot **самостоятельно перепишет** server-блок: добавит `listen 443 ssl http2`, пути к сертификату, и server-блок с редиректом 80 → 443.

#### 4. Обновления приложения

Просто запускаем `./deploy.sh` локально снова — старый контейнер заменяется новым, хостовый nginx без изменений (проксирует на тот же порт).

#### 5. Обновление SSL

Полностью автоматическое. `certbot.timer` (systemd) запускается раз в день, обновляет сертификат при необходимости (за ≤30 дней до истечения) и перезагружает nginx. Проверить: `systemctl list-timers | grep certbot`.

---

## Режим B — Статические файлы напрямую через nginx

**Когда выбирать:** не хотите Docker на VPS, нужен минимум memory/CPU footprint, рады билдить локально и пушить артефакты по rsync.

**Архитектура:**

```
[Локально] npm run build → ./dist/
        rsync → user@vps:/var/www/konex/
[Клиент] —HTTPS→ [хост nginx :443 SSL]—static→ /var/www/konex/index.html
                                   ↑
                         certbot выдаёт сертификат
```

### Шаги

#### 1. Однократная настройка хоста

```bash
# С локальной машины:
scp site/static-mode/deploy-host-setup.sh user@vps:/tmp/
ssh user@vps 'sudo bash /tmp/deploy-host-setup.sh'
```

Что делает:
- ставит `nginx`, `certbot`, `python3-certbot-nginx`, `rsync`;
- создаёт `/var/www/konex` с владельцем `www-data:www-data`, режим 755;
- открывает порты 80/443 в UFW;
- проверяет include `sites-enabled/*.conf`.

#### 2. Сборка и публикация

Локально:

```bash
npm run build
./site/static-mode/publish.sh user@vps example.com
```

Скрипт `publish.sh` запускает:

```bash
rsync -avz --delete ./dist/ user@vps:/var/www/konex/
```

Флаг `--delete` удаляет на сервере файлы, которых уже нет локально (старые ассеты). Если боитесь — уберите флаг.

#### 3. Включение сайта

```bash
scp site/static-mode/konex.conf.example user@vps:/tmp/
scp site/static-mode/enable-site.sh    user@vps:/tmp/
ssh user@vps
sudo bash /tmp/enable-site.sh example.com you@example.com /var/www/konex
```

Скрипт делает то же самое, что и в режиме A, но без upstream-порта — просто статика из `/var/www/konex`.

#### 4. Обновления приложения

```bash
npm run build && ./site/static-mode/publish.sh user@vps example.com
```

Хостовый nginx ничего перечитывать не нужно — он раздаёт файлы из ФС напрямую. HTML-кеш в шаблоне выставлен `Cache-Control: must-revalidate`, ассеты с long-term cache (`/_astro/*` immutable 1 год) — это безопасно, потому что Astro хеширует имена файлов.

#### 5. Обновление SSL

То же, что в режиме A — автоматический `certbot.timer`.

---

## Multi-environment (dev + prod на одном сервере)

Часто на одном VPS нужно держать **демонстрационный (dev)** и **боевой (prod)** инстанс одновременно — на разных доменах, на разных портах, с разными SSL-сертификатами. Скрипт `deploy.sh` поддерживает это через флаг `--env=<name>`, который читает соответствующий `.env.deploy.<env>` файл и подставляет суффикс в имя контейнера/тег образа.

### Архитектура

```
[Клиент] —HTTPS→ [хост nginx] ┬─→ [контейнер dev-example :8080]   (dev.example.com)
                              └─→ [контейнер konex-v3-prod :8081]  (example.com)
```

- Контейнеры **никогда не пересекаются** по имени и порту:
  - `dev-example` слушает на `127.0.0.1:8080`,
  - `konex-v3-prod` слушает на `127.0.0.1:8081`.
- Хост-nginx маршрутизирует по `server_name`:
  - `dev.example.com` → `proxy_pass http://127.0.0.1:8080`,
  - `example.com` → `proxy_pass http://127.0.0.1:8081`.
- Certbot выпускает **отдельный сертификат для каждого домена**.

### Шаги (Docker-mode A)

#### 1. Настройка хоста — однократно

```bash
ssh user@vps
sudo bash /tmp/deploy-host-setup.sh   # см. site/docker-mode/deploy-host-setup.sh
```

#### 2. Конфиги .env для двух окружений (локально)

```bash
# Скопируйте шаблоны в корень проекта (gitignored):
cp site/.env.deploy.dev.example  .env.deploy.dev
cp site/.env.deploy.prod.example .env.deploy.prod

# Заполните VPS_HOST, SSH_KEY и убедитесь, что VPS_PORT разные:
#   .env.deploy.dev  → VPS_PORT=8080
#   .env.deploy.prod → VPS_PORT=8081
```

#### 3. Запуск контейнеров

```bash
./deploy.sh --env=dev    # build → ship → run dev-example :8080
./deploy.sh --env=prod   # build → ship → run konex-v3-prod :8081
```

`--env=dev` использует `.env.deploy.dev` и создаёт `dev-example` с тегом `dev-<git-sha>`. То же для prod. Контейнеры независимы — `--no-build` и `--logs` работают per-env (`./deploy.sh --env=dev --logs`).

#### 4. Включение двух доменов в хостовом nginx

С локальной машины загрузите шаблон и enable-скрипт:

```bash
scp site/docker-mode/konex.conf.example user@vps:/tmp/
scp site/docker-mode/enable-site.sh    user@vps:/tmp/
```

На VPS — выпустите два отдельных конфига и сертификата:

```bash
ssh user@vps
# dev:
sudo bash /tmp/enable-site.sh dev.example.com you@example.com 8080
# prod:
sudo bash /tmp/enable-site.sh example.com    you@example.com 8081
```

`enable-site.sh` идемпотентен — если запустить ещё раз с тем же доменом, conf просто перепишется и certbot обновит сертификат при необходимости.

#### 5. Обновление одного окружения

Просто запустите `./deploy.sh --env=dev` или `./deploy.sh --env=prod` снова. Хост-nginx, конфиги и сертификаты не трогаются — только Docker-контейнер пересоздаётся.

### Static-mode (B) для двух окружений

Аналогично, только вместо `VPS_PORT` различаются webroot-папки:

```bash
sudo bash /tmp/deploy-host-setup.sh /var/www/konex-dev
sudo bash /tmp/deploy-host-setup.sh /var/www/konex
```

И `publish.sh` принимает webroot третьим аргументом:

```bash
./site/static-mode/publish.sh user@vps dev.example.com  /var/www/konex-dev
./site/static-mode/publish.sh user@vps     example.com  /var/www/konex
```

`enable-site.sh` тоже принимает webroot:

```bash
sudo bash /tmp/enable-site.sh dev.example.com you@example.com /var/www/konex-dev
sudo bash /tmp/enable-site.sh     example.com you@example.com /var/www/konex
```

### Backward compatibility

`./deploy.sh` без флага по-прежнему работает: читает `.env.deploy`, использует имя `konex-v3` (без суффикса). Если у вас уже есть рабочий `.env.deploy` — он не затронут.

---

## Multi-site (несколько сайтов на одном VPS)

Хостовый nginx обслуживает любое число сайтов одновременно. Для каждого:

- свой server-блок в `/etc/nginx/sites-available/<domain>.conf`,
- свой симлинк в `/etc/nginx/sites-enabled/`,
- свой сертификат от certbot (`certbot --nginx -d <domain>`).

Все примеры в этой папке используют `server_name __DOMAIN__` и не трогают глобальные `nginx.conf`, `nginx-default.conf` или дефолтный server-блок. Поэтому **не должно быть конфликта** с другими сайтами на этом же VPS.

Если конфигурация nginx у вас не использует `sites-enabled/*.conf` (например, всё лежит в `/etc/nginx/conf.d/`), просто кладите конфиги в `/etc/nginx/conf.d/<domain>.conf` — `enable-site.sh` поддерживает обе схемы через флаг `--conf-d` (см. ниже).

---

## Чек-лист отладки

| Симптом | Проверка |
|---|---|
| `permission denied while trying to connect to the docker API at unix:///var/run/docker.sock` | SSH-пользователь не в группе `docker`. На VPS: `sudo usermod -aG docker $USER`, затем **перелогиниться** в SSH (закрыть терминал и открыть снова) — без рестарта сессии новая группа не подхватится. Проверка: `docker version` без sudo. Если `deploy-host-setup.sh` уже запускался с правильным `SUDO_USER`/аргументом, скрипт это сделал автоматически — просто перелогиньтесь. |
| `502 Bad Gateway` на сайте (режим A) | `ssh user@vps 'docker ps'` — контейнер запущен? `curl http://127.0.0.1:${VPS_PORT}` — отвечает? Если нет — `docker logs konex-v3`. |
| `403 Forbidden` (режим B) | Права на `/var/www/konex/` — должен быть `www-data:www-data`, `chmod -R o+r`. |
| `nginx -t` ругается на синтаксис | После замены плейсхолдеров `__DOMAIN__` проверьте, что в конфиге не осталось двойных подчёркиваний. |
| certbot падает с `Connection refused` | DNS не успел распространиться — подождите 5-10 минут, перепроверьте `dig +short example.com`. |
| certbot падает с `Timeout` на 80 порту | UFW закрывает порт. `sudo ufw status`, `sudo ufw allow 80/tcp`. |
| После certbot нет редиректа 80→443 | Запускали без `--redirect` — повторите: `sudo certbot --nginx -d example.com --redirect`. |
| Сертификат не обновляется автоматически | `sudo systemctl status certbot.timer` — должен быть active. Принудительно: `sudo certbot renew --force-renewal && sudo systemctl reload nginx`. |
| Хочу удалить сайт | `sudo rm /etc/nginx/sites-enabled/example.com.conf && sudo nginx -t && sudo systemctl reload nginx`, затем `sudo certbot delete --cert-name example.com`. |

### Полезные команды

```bash
# Логи nginx
sudo journalctl -u nginx -f
sudo tail -f /var/log/nginx/konex.access.log
sudo tail -f /var/log/nginx/konex.error.log

# Логи Docker (режим A)
docker logs -f konex-v3

# Принудительное обновление SSL
sudo certbot renew --force-renewal --cert-name example.com
sudo systemctl reload nginx

# Список включённых сайтов
ls -la /etc/nginx/sites-enabled/
```

---

## Что в этой папке НЕ изменено

- `Dockerfile`, `Dockerfile.dev`, `docker-compose.yml` в корне — без изменений.
- `nginx.conf` в корне — без изменений (это конфиг nginx **внутри** контейнера, не на хосте).
- `deploy.sh` в корне — без изменений; используется в режиме A для запуска контейнера.

Все артефакты этой задачи — только в `site/`.
