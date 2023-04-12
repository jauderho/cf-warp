#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:d0b456784d40354f567844fbebfbbd93b6501c7e76c9ea9f3082aefbbb13be22 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:d0b456784d40354f567844fbebfbbd93b6501c7e76c9ea9f3082aefbbb13be22

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
