FROM node:23.8.0-alpine3.20@sha256:3a6c6fbb9de9917f9f0bd6335fbb9427d1688a656643155f5dcdc7df91923816 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.8.0-alpine3.20@sha256:3a6c6fbb9de9917f9f0bd6335fbb9427d1688a656643155f5dcdc7df91923816

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
