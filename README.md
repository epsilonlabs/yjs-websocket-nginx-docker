# YJS Web Socket with Nginx Reverse Proxy Docker Image

This image runs [y-websocket](https://github.com/yjs/y-websocket) behind an Nginx reverse proxy and exposes it under the `/ws/` path. Its purpose is to enable y-websocket servers to run on HTTP(S)-only services such as Amazon Lightsail.

The version of y-websocket used in this image accumulates documents in memory until it exhausts the available memory. To address this, the image includes a health checking service (accessible at `/`) that returns a status of 200 if memory usage is below 80%, and a status of 500 if it exceeds 80%. This allows Amazon Lightsail to restart the container before y-websocket becomes too sluggish.

## Building and Running

You can use the following commands to build and run the image locally.

- `docker image build -t yjs-websocket-nginx .`
- `docker run -p 80:80 yjs-websocket-nginx:latest`

You can then access the web socket via `ws://localhost/ws`.