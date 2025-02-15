#!/bin/bash

set -e
HOST=0.0.0.0 PORT=1234 npx y-websocket &

# nginx as frontend + reverse proxy
# envsubst < /etc/nginx.conf.template > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;" &

# wait for them all
wait -n
