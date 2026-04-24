#!/bin/sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
COMPOSE_FILE="$SCRIPT_DIR/.devcontainer/docker-compose.yml"

if [ "$1" = "--stop" ] || [ "$1" = "stop" ]; then
    echo "==> Stopping containers..."
    docker compose -f "$COMPOSE_FILE" down --remove-orphans 2>/dev/null || true
    echo "==> Stopped!"
    exit 0
fi

cd "$SCRIPT_DIR"

echo "==> Stopping old containers..."
docker compose -f "$COMPOSE_FILE" down --remove-orphans 2>/dev/null || true

echo "==> Starting services..."
docker compose -f "$COMPOSE_FILE" up -d

echo "==> Waiting for services..."
sleep 15

echo "==> Testing..."
curl -s http://localhost:3000/health && echo "" || echo "Health check failed"

echo ""
echo "==> Done!"
echo "   Web: http://localhost:3000"
echo "   PostgreSQL: localhost:5432"
echo ""
echo "   To stop: ./start-dev.sh --stop"