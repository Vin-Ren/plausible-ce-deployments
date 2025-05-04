FROM ghcr.io/plausible/community-edition:v3.0.1


# Environment setup (override with `-e` at runtime if needed)
ENV TMPDIR=/var/lib/plausible/tmp

# Add example required env vars (replace with actual ones or use `--env` in run)

# HEALTHCHECK --start-period=60s CMD curl -f http://localhost:8000 || exit 1

# VOLUME ["/var/lib/plausible"]

# Entry script
COPY entrypoint.sh /entrypoint-custom.sh
# RUN chmod +x /entrypoint-custom.sh
# RUN ls -al /

# COPY DATABASE_URL /run/secrets/DATABASE_URL
RUN ["wget", "https://curl.se/ca/cacert.pem", "-O", "/app/GLOBAL_CACERT.pem"]
COPY extra_conf.exs /app/extra_conf.exs

# ENTRYPOINT [ "/bin/sh" ]
ENTRYPOINT ["/entrypoint-custom.sh"]
