#!/bin/sh
echo $DATABASE_URL
echo $CLICKHOUSE_DATABASE_URL
wget $CLICKHOUSE_DATABASE_URL
ulimit -n 65535

echo GETTING LATEST CACERT.pem...
wget https://curl.se/ca/cacert.pem -O /app/GLOBAL_CACERT.pem
echo CREATING DB...
/entrypoint.sh db createdb
echo MIGRATING...
/entrypoint.sh db migrate
echo RUNNING...
exec /entrypoint.sh run
