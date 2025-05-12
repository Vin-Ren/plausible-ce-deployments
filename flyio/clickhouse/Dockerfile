FROM clickhouse/clickhouse-server:24.12-alpine

RUN apk add --no-cache python3 curl

# Copy configs directly into image
COPY logs.xml /etc/clickhouse-server/config.d/logs.xml
COPY ipv6-only.xml /etc/clickhouse-server/config.d/ipv6-only.xml
COPY low-resources.xml /etc/clickhouse-server/config.d/low-resources.xml
RUN mv /etc/clickhouse-server/config.d/docker_related_config.xml /trash.xml

# Copy scripts
COPY entrypoint.sh /usr/local/bin/entrypoint-custom.sh
RUN chmod +x /usr/local/bin/entrypoint-custom.sh
COPY health-check.sh /health-check.sh
RUN chmod +x /health-check.sh

ENTRYPOINT ["entrypoint-custom.sh"]
