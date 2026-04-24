FROM node:20-bookworm

WORKDIR /workspace

RUN apt-get update && apt-get install -y docker.io vim git postgresql-client && rm -rf /var/lib/apt/lists/*

COPY .devcontainer/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]