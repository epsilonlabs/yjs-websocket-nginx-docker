#!/bin/bash

set -e

# Start y-websocket
HOST=0.0.0.0 PORT=1234 npx y-websocket &

# Start the health monitoring service
node health.js &

# nginx as frontend + reverse proxy
nginx -g "daemon off;" &

# wait for them all
wait -n
