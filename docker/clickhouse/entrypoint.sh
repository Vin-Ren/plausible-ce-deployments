#!/bin/sh

# Simulate ulimit
ulimit -n 262144

# Start ClickHouse
exec /entrypoint.sh
