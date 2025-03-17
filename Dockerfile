FROM node:23.10.0-alpine3.20@sha256:16185f3ca169814fbd3af0d31acc0e27a6e737a7a948709f6788439476733654 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.10.0-alpine3.20@sha256:16185f3ca169814fbd3af0d31acc0e27a6e737a7a948709f6788439476733654

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
