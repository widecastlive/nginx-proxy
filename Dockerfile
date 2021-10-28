FROM nginx:stable

RUN runtimeDeps='inotify-tools' \
    && apt-get update && apt-get install -y $runtimeDeps --no-install-recommends

COPY sslconfig.conf /etc/nginx/snippets/sslconfig.conf
COPY entrypoint.sh /docker-entrypoint.d/40-autoreload-configuration.sh
RUN chmod +x /docker-entrypoint.d/40-autoreload-configuration.sh