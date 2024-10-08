FROM node:22.9-alpine3.20@sha256:c9bb43423a6229aeddf3d16ae6aaa0ff71a0b2951ce18ec8fedb6f5d766cf286 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:22.9-alpine3.20@sha256:c9bb43423a6229aeddf3d16ae6aaa0ff71a0b2951ce18ec8fedb6f5d766cf286

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
