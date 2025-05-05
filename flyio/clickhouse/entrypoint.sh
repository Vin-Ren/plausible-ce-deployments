#!/bin/sh

# Simulate ulimit
ulimit -n 262144

/health-check.sh &

# Start ClickHouse
exec /entrypoint.sh
