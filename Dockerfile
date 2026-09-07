FROM oven/bun:1-alpine@sha256:d888c0ae6c86d7866ff10c5aafdd9077b36aee6455b33dd270fb93c0dd5cef6f AS build

WORKDIR /app
# Workspace manifests + single lockfile; --filter limits install to the
# cf-warp CLI package so the web member's deps (express, etc.) are skipped.
COPY package.json bun.lock ./
COPY web/package.json ./web/
RUN bun install --frozen-lockfile --production --filter cf-warp
COPY . .

# ----------------------------------------------------------------------------

FROM oven/bun:1-alpine@sha256:d888c0ae6c86d7866ff10c5aafdd9077b36aee6455b33dd270fb93c0dd5cef6f

WORKDIR /app
COPY --from=build /app .

ENTRYPOINT ["bun", "cli.js"]
