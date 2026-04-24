## Run Docker Compose in Coder

This repository is configured so the Coder workspace builds from `.devcontainer/devcontainer.json`, then you can run Docker Compose manually inside the workspace.

Requirements in Coder:

- The workspace must have access to a Docker daemon.
- Usually that means mounting `/var/run/docker.sock` into the workspace or enabling Docker-in-Docker in the Coder template.

After the workspace opens:

```sh
./start-dev.sh
```

The script will verify that Docker and Docker Compose are available before starting:

- `node-app` on port `3000`
- `postgres` on port `5432`

Stop services with:

```sh
./start-dev.sh --stop
```
