FROM node:20-bookworm

WORKDIR /workspaces

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    docker.io \
    docker-compose-v2 \
    git \
    postgresql-client \
    vim \
    && rm -rf /var/lib/apt/lists/*
