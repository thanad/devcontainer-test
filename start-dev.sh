#!/bin/sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
COMPOSE_FILE="$SCRIPT_DIR/.devcontainer/docker-compose.yml"

if ! command -v docker >/dev/null 2>&1; then
    echo "Docker CLI is not installed in this workspace."
    echo "Rebuild the devcontainer so .devcontainer/Dockerfile installs docker."
    exit 1
fi

if ! docker info >/dev/null 2>&1; then
    echo "Docker daemon is not reachable from this workspace."
    echo "Coder must expose /var/run/docker.sock or run the workspace with Docker-in-Docker."
    exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
    echo "Docker Compose v2 is not available."
    echo "Rebuild the devcontainer so docker-compose-v2 is installed."
    exit 1
fi

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
