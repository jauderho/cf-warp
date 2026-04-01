FROM node:25.8.2-alpine3.23@sha256:cf38e1f3c28ac9d81cdc0c51d8220320b3b618780e44ef96a39f76f7dbfef023 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:25.8.2-alpine3.23@sha256:cf38e1f3c28ac9d81cdc0c51d8220320b3b618780e44ef96a39f76f7dbfef023

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
