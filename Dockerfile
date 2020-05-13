FROM caddy:alpine
LABEL org.opencontainers.image.authors="Vlad Volkov <vlad@hiberbee.com>" \
      org.opencontainers.image.description="" \
      org.opencontainers.image.source="https://github.com/hiberbee/yamlschema" \
      org.opencontainers.image.title="YAML configs schema" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.url="docker.pkg.github.com/hiberbee/yamlschema/server" \
      org.opencontainers.image.vendor="Hiberbee"
RUN addgroup -S hiberbee -g 1000 && adduser -S -G hiberbee -u 1000 hiberbee
WORKDIR /var/www/html
COPY --chown=hiberbee src/main/jsonschema .
COPY Caddyfile /etc/caddy/
EXPOSE 8080
