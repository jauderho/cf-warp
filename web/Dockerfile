# Build context MUST be the repository root (the web app depends on the
# local cf-warp fork via "file:.."), e.g.:
#   docker build -f web/Dockerfile -t cf-warpweb .
FROM oven/bun:1-alpine@sha256:d888c0ae6c86d7866ff10c5aafdd9077b36aee6455b33dd270fb93c0dd5cef6f AS build

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

FROM oven/bun:1-alpine@sha256:d888c0ae6c86d7866ff10c5aafdd9077b36aee6455b33dd270fb93c0dd5cef6f

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

WORKDIR /app/web
CMD ["bun", "index.js"]
