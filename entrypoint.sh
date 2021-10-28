#!/bin/sh

set -e

ME=$(basename $0)

watch() {
  while inotifywait -q -r --exclude '\.git/' -e modify,create,delete,move,move_self /etc/nginx /etc/letsencrypt; do
    echo >&3 "$ME: Configuration changes detected. Will send reload signal to nginx in 15 seconds..."
    sleep 15
    echo >&3 "$ME: Send reload signal"
    nginx -s reload
  done
}

watch &