FROM ghcr.io/plausible/community-edition:v3.0.1

ENV TMPDIR=/var/lib/plausible/tmp

COPY entrypoint.sh /entrypoint-custom.sh
RUN chmod +x /entrypoint-custom.sh

USER root
RUN wget https://curl.se/ca/cacert.pem -O /tmp/cacert.pem && \
    mkdir -p /app && mv /tmp/cacert.pem /app/GLOBAL_CACERT.pem
COPY extra_conf.exs /app/extra_conf.exs

ENTRYPOINT ["/entrypoint-custom.sh"]
