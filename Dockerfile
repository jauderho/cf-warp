FROM oven/bun:1-alpine@sha256:5acc90a93e91ff07bf72aa90a7c9f0fa189765aec90b47bdbf2152d2196383c0 AS build

WORKDIR /app
# Workspace manifests + single lockfile; --filter limits install to the
# cf-warp CLI package so the web member's deps (express, etc.) are skipped.
COPY package.json bun.lock ./
COPY web/package.json ./web/
RUN bun install --frozen-lockfile --production --filter cf-warp
COPY . .

# ----------------------------------------------------------------------------

FROM oven/bun:1-alpine@sha256:5acc90a93e91ff07bf72aa90a7c9f0fa189765aec90b47bdbf2152d2196383c0

WORKDIR /app
COPY --from=build /app .

ENTRYPOINT ["bun", "cli.js"]
