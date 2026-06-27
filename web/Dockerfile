# Build context MUST be the repository root (the web app depends on the
# local cf-warp fork via "file:.."), e.g.:
#   docker build -f web/Dockerfile -t cf-warpweb .
FROM oven/bun:1-alpine@sha256:5acc90a93e91ff07bf72aa90a7c9f0fa189765aec90b47bdbf2152d2196383c0 AS build

WORKDIR /app
# Workspace manifests + single lockfile (root package + web member)
COPY package.json bun.lock ./
COPY web/package.json ./web/
# The local cf-warp source must exist before install so the "file:.."
# dependency can be packed into the web workspace.
COPY cli.js ./
COPY lib ./lib
RUN bun install --frozen-lockfile
COPY web/index.js ./web/

# ----------------------------------------------------------------------------

FROM oven/bun:1-alpine@sha256:5acc90a93e91ff07bf72aa90a7c9f0fa189765aec90b47bdbf2152d2196383c0

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

WORKDIR /app/web
CMD ["bun", "index.js"]
