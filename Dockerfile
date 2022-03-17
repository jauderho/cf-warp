#FROM node:14-alpine3.14 AS build
FROM node:17-alpine3.15@sha256:d1d5dc5de1501601c6f5a1bcac25b5d2060f9127663ac41273a6abfcaa68569b AS build

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
