FROM caddy:alpine
WORKDIR /var/www/html
COPY src/main/jsonschema .
COPY Caddyfile /etc/caddy/
