## Run In Coder Without Docker Compose

This branch is configured for Coder as a single-container devcontainer. It does not require Docker Compose or access to `/var/run/docker.sock`.

After the workspace opens:

```sh
npm install
npm run dev
```

The app will be available on port `3000`.

Database notes:

- If `DATABASE_URL` is not set, the app defaults to `postgres://postgres:postgres@localhost:5432/postgres`.
- The server still starts even if PostgreSQL is unavailable.
- Check `GET /health` to confirm database connectivity.
