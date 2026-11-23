# Build context MUST be the repository root (the web app depends on the
# local cf-warp fork via "file:.."), e.g.:
#   docker build -f web/Dockerfile -t cf-warpweb .
FROM oven/bun:1-alpine@sha256:da816670775f4c2b4e990b6b1847cf5540dcdc721a42033dd331ce7a88ba6a3b AS build

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

FROM oven/bun:1-alpine@sha256:da816670775f4c2b4e990b6b1847cf5540dcdc721a42033dd331ce7a88ba6a3b

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

WORKDIR /app/web
CMD ["bun", "index.js"]
