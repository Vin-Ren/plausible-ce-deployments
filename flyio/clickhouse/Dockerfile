FROM clickhouse/clickhouse-server:24.12-alpine

# ENV CLICKHOUSE_SKIP_USER_SETUP=1

# Copy configs directly into image
COPY logs.xml /etc/clickhouse-server/config.d/logs.xml
COPY ipv6-only.xml /etc/clickhouse-server/config.d/ipv6-only.xml
COPY low-resources.xml /etc/clickhouse-server/config.d/low-resources.xml
RUN mv /etc/clickhouse-server/config.d/docker_related_config.xml /trash.xml

# HEALTHCHECK --start-period=60s CMD wget --no-verbose --tries=1 -O - http://127.0.0.1:8123/ping || exit 1

COPY entrypoint.sh /usr/local/bin/entrypoint-custom.sh
RUN chmod +x /usr/local/bin/entrypoint-custom.sh

ENTRYPOINT ["entrypoint-custom.sh"]
