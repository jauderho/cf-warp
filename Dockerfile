FROM node:23.2-alpine3.20@sha256:ecefaffd4706c5879af52e022fdb8ea30cbd6590e2a30d05347790d690727c6c AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.2-alpine3.20@sha256:ecefaffd4706c5879af52e022fdb8ea30cbd6590e2a30d05347790d690727c6c

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
