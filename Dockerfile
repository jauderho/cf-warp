FROM node:24.0.0-alpine3.20@sha256:dc077fd8a65f08c6e3f29b07088622bc1ba707a91d9183f4507b9b4a8a874d91 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:24.0.0-alpine3.20@sha256:dc077fd8a65f08c6e3f29b07088622bc1ba707a91d9183f4507b9b4a8a874d91

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
