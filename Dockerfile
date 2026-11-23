FROM oven/bun:1-alpine@sha256:da816670775f4c2b4e990b6b1847cf5540dcdc721a42033dd331ce7a88ba6a3b AS build

WORKDIR /app
# Workspace manifests + single lockfile; --filter limits install to the
# cf-warp CLI package so the web member's deps (express, etc.) are skipped.
COPY package.json bun.lock ./
COPY web/package.json ./web/
RUN bun install --frozen-lockfile --production --filter cf-warp
COPY . .

# ----------------------------------------------------------------------------

FROM oven/bun:1-alpine@sha256:da816670775f4c2b4e990b6b1847cf5540dcdc721a42033dd331ce7a88ba6a3b

WORKDIR /app
COPY --from=build /app .

ENTRYPOINT ["bun", "cli.js"]
