# YJS Web Socket with Nginx Reverse Proxy Docker Image

This image runs [y-websocket](https://github.com/yjs/y-websocket) behind an Nginx reverse proxy and exposes it under the `/ws/` path. Its purpose is to enable y-websocket servers to run on HTTP(S)-only services such as Amazon Lightsail.

## Building and Running

To build and run the image locally, you can use the following commands.

- `docker image build -t yjs-websocket-nginx .`
- `docker run -p 80:80 yjs-websocket-nginx:latest`

You can then access the web socket via `ws://localhost/ws`.