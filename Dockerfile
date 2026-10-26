FROM oven/bun:1-alpine@sha256:4cf82f5686b196504fe119db3fcd9185b191f82ece82c40680e597228ec6070a AS build

WORKDIR /app
# Workspace manifests + single lockfile; --filter limits install to the
# cf-warp CLI package so the web member's deps (express, etc.) are skipped.
COPY package.json bun.lock ./
COPY web/package.json ./web/
RUN bun install --frozen-lockfile --production --filter cf-warp
COPY . .

# ----------------------------------------------------------------------------

FROM oven/bun:1-alpine@sha256:4cf82f5686b196504fe119db3fcd9185b191f82ece82c40680e597228ec6070a

WORKDIR /app
COPY --from=build /app .

ENTRYPOINT ["bun", "cli.js"]
