#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:a1c01a01ecb29c6a8bdfdcd49a887a01efa482334fcd87a3dc9e5bc89fcf74b4 AS build

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
