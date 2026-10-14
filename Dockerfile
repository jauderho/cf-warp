FROM oven/bun:1-alpine@sha256:629e17411f1f129dbec3af78d5af9c9f2a937435c80349437206c6b0b7422373 AS build

WORKDIR /app
# Workspace manifests + single lockfile; --filter limits install to the
# cf-warp CLI package so the web member's deps (express, etc.) are skipped.
COPY package.json bun.lock ./
COPY web/package.json ./web/
RUN bun install --frozen-lockfile --production --filter cf-warp
COPY . .

# ----------------------------------------------------------------------------

FROM oven/bun:1-alpine@sha256:629e17411f1f129dbec3af78d5af9c9f2a937435c80349437206c6b0b7422373

WORKDIR /app
COPY --from=build /app .

ENTRYPOINT ["bun", "cli.js"]
