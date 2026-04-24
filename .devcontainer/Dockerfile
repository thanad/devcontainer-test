FROM node:20-bookworm

WORKDIR /workspaces

RUN apt-get update && apt-get install -y \
    git \
    postgresql-client \
    vim \
    && rm -rf /var/lib/apt/lists/*
