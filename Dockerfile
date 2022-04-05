#FROM node:14-alpine3.14 AS build
FROM node:17-alpine3.15@sha256:cb273bf1e93f431f1e9f28b662f64e5e573c65c47c4f65e3b29d3136e0050f19 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:17-alpine3.15

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
