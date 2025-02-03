FROM node:23.7.0-alpine3.20@sha256:3ac002b133fd3737c44b66f0d023f5d75c7a1ddec71954fa06486aed6aead888 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.7.0-alpine3.20@sha256:3ac002b133fd3737c44b66f0d023f5d75c7a1ddec71954fa06486aed6aead888

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
