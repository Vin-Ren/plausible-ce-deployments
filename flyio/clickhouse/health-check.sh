#!/bin/sh

echo "HEALTH CHECK STARTING..."
set -e

# Create health check directory
mkdir -p /var/www
touch /var/www/index.html

# Start BusyBox HTTP server in background, bound to all interfaces
python3 -m http.server 8080 --bind 0.0.0.0 --directory /var/www &

# Loop to update health status
while true; do
  if curl -s http://[::1]:8123/ping | grep -q "Ok"; then
    echo "OK" > /var/www/index.html
  else
    echo "FAIL" > /var/www/index.html
  fi
  sleep 5
done

echo "HEALTH CHECK STOPPING..."
