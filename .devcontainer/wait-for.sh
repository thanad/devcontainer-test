#!/bin/sh
set -e

until nc -z postgres 5432; do
  echo "Waiting for PostgreSQL..."
  sleep 2
done

echo "PostgreSQL is ready!"
exec "$@"