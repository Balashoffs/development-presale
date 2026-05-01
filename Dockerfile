# syntax=docker/dockerfile:1.7

# ===== STAGE 1: BUILD (Flutter SDK on Debian) =====
FROM debian:bookworm-slim AS build-env

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl git unzip ca-certificates xz-utils \
    && rm -rf /var/lib/apt/lists/*

ARG FLUTTER_SDK=/usr/local/flutter
ARG FLUTTER_VERSION=3.35.1
ARG APP=/app

RUN git clone --depth 1 --branch ${FLUTTER_VERSION} https://github.com/flutter/flutter.git ${FLUTTER_SDK}
ENV PATH="${FLUTTER_SDK}/bin:${FLUTTER_SDK}/bin/cache/dart-sdk/bin:${PATH}"

# Pre-warm Dart/Flutter SDKs so subsequent steps are fast.
RUN flutter --version

WORKDIR ${APP}
COPY . ${APP}

# Per-consumer config injected via --build-arg (base64-encoded).
ARG DART_DEFINE_FILE_CONTENT

RUN printf '%s' "$DART_DEFINE_FILE_CONTENT" | base64 -d > /app/dart-define-file.json

RUN flutter clean \
 && flutter pub get \
 && dart run build_runner build --delete-conflicting-outputs \
 && flutter build web --release \
        --dart-define-from-file=/app/dart-define-file.json \
        --dart-define=timestamp=$(date +%s)

# ===== STAGE 2: RUNTIME (Nginx) =====
FROM nginx:1.27.3-alpine AS runtime

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-env /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
