FROM ghcr.io/plausible/community-edition:v3.0.1


# Environment setup (override with `-e` at runtime if needed)
ENV TMPDIR=/var/lib/plausible/tmp

# Add example required env vars (replace with actual ones or use `--env` in run)
# ENV BASE_URL="http://localhost:8000"
ENV BASE_URL="https://worked-illustrated-major-liability.trycloudflare.com"
ENV SECRET_KEY_BASE="bf32e21c00dd975cc604ab1bd1c5b9b8fb005c4bf1bd3e532c2d06512e721e52b489a734e486c6f8813d870806579a74"
ENV ADMIN_USER_EMAIL="admin-mail"
ENV ADMIN_USER_NAME="admin-user"
ENV ADMIN_USER_PWD="admin-pwd"
# ENV DATABASE_URL=ecto://postgres:postgres@plausible-db:5432/plausible_db
ENV DATABASE_URL="postgresql://plausible-db_owner:npg_SGxMQfH8Zg9W@ep-calm-morning-a1gomobk-pooler.ap-southeast-1.aws.neon.tech/plausible-db?sslmode=require"
ENV CLICKHOUSE_DATABASE_URL="http://plausible-events-db:8123/plausible_events_db"
ENV DATABASE_CACERTFILE="/var/lib/plausible/GLOBAL_CACERT.pem"

HEALTHCHECK --start-period=60s CMD curl -f http://localhost:8000 || exit 1

VOLUME ["/var/lib/plausible"]

# Entry script
COPY entrypoint.sh /entrypoint-custom.sh
# RUN chmod +x /entrypoint-custom.sh
# RUN ls -al /

# COPY DATABASE_URL /run/secrets/DATABASE_URL
COPY cacert.pem /var/lib/plausible/GLOBAL_CACERT.pem

# ENTRYPOINT [ "/bin/sh" ]
ENTRYPOINT ["/entrypoint-custom.sh"]
