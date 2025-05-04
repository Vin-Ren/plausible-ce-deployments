#!/bin/sh
ulimit -n 65535

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
