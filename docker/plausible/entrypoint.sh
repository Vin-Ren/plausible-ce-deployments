#!/bin/sh
# echo $DATABASE_URL
# ls /run/secrets
# cat /run/secrets/DATABASE_URL

ulimit -n 65535


echo CREATING DB...
/entrypoint.sh db createdb
echo MIGRATING...
/entrypoint.sh db migrate
echo RUNNING...
exec /entrypoint.sh run
# sh