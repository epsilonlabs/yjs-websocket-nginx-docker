FROM nginx:latest

# Needed to avoid prompts blocking the build process
ENV DEBIAN_FRONTEND=noninteractive

# Needed for Cloud Build
ENV PORT=80

# Install tini
RUN apt-get update \
    && apt-get install -y nodejs npm tini netcat-traditional \
    && rm -rf /var/lib/apt/lists/*

# ADD ./nginx.conf.template /etc/nginx.conf.template
COPY nginx.conf /etc/nginx/nginx.conf

# Copy start script and make it executable
ADD start.sh /
RUN chmod +x /start.sh

ENTRYPOINT ["/usr/bin/tini", "--", "/start.sh"]