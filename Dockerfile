FROM nginx:stable

# Needed to avoid prompts blocking the build process
ENV DEBIAN_FRONTEND=noninteractive

# Needed for Cloud Build
ENV PORT=80

# Install tini
RUN apt-get update \
    && apt-get install -y nodejs npm tini netcat-traditional \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g y-websocket@2.1.0

# ADD ./nginx.conf.template /etc/nginx.conf.template
COPY nginx.conf /etc/nginx/nginx.conf

# Copy start script and make it executable
ADD start.sh /
RUN chmod +x /start.sh

WORKDIR /health
# Copy health.js script
ADD health.js /health
RUN npm install express

ENTRYPOINT ["/usr/bin/tini", "--", "/start.sh"]