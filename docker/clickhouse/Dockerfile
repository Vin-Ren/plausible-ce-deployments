FROM clickhouse/clickhouse-server:24.12-alpine

ENV CLICKHOUSE_SKIP_USER_SETUP=1

# Copy configs directly into image
# COPY clickhouse-config.xml /etc/clickhouse-server/config.d/logging.xml
# COPY clickhouse-user-config.xml /etc/clickhouse-server/users.d/logging.xml

COPY logs.xml /etc/clickhouse-server/config.d/logs.xml
COPY ipv4-only.xml /etc/clickhouse-server/config.d/ipv4-only.xml
COPY low-resources.xml /etc/clickhouse-server/config.d/low-resources.xml

HEALTHCHECK --start-period=60s CMD wget --no-verbose --tries=1 -O - http://127.0.0.1:8123/ping || exit 1

VOLUME ["/var/lib/clickhouse"]

COPY entrypoint.sh /usr/local/bin/entrypoint-custom.sh
RUN chmod +x /usr/local/bin/entrypoint-custom.sh

ENTRYPOINT ["entrypoint-custom.sh"]
