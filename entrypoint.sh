#!/bin/bash
set -e

rm -f /app/pids/unicorn.pid
rm -f /app/tmp/server.pid

rm -rf tmp
ln -s /tmp/rails-app tmp

exec "$@"

