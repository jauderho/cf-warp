#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:dda50fd533b57096bfb959afa8bfd290dc3c127207907177b578d44ee14d7119 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:dda50fd533b57096bfb959afa8bfd290dc3c127207907177b578d44ee14d7119

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
