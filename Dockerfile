#FROM node:14-alpine3.14 AS build
FROM node:17-alpine3.15@sha256:e4a152d1564f2e89d5fa46d74b9f5a050a601322aa10bc405a32faaf1085c5f0 AS build

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
