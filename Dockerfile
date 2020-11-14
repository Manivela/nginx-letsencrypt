FROM nginx:1.19.2-alpine
RUN apk add inotify-tools certbot openssl ca-certificates
WORKDIR /opt
COPY entrypoint.sh /docker-entrypoint.d/30-lets-encrypt.sh
COPY certbot.sh certbot.sh
COPY default.conf.template /etc/nginx/templates/default.conf.template
COPY ssl-options/ /etc/ssl-options
RUN chmod +x /docker-entrypoint.d/30-lets-encrypt.sh && \
    chmod +x certbot.sh