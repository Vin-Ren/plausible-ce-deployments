#!/bin/sh
ulimit -n 65535

(
  while true; do
    wget $CLICKHOUSE_DATABASE_PING_URL -O /dev/null >/dev/null 2>&1
    sleep 5
  done
) &

if [ "$1" = "release" ]; then
  echo "Preparing plausible for release..."
  echo CREATING DB...
  /entrypoint.sh db createdb
  echo MIGRATING...
  /entrypoint.sh db migrate
else
  echo RUNNING PLAUSIBLE...
  exec /entrypoint.sh run
fi
