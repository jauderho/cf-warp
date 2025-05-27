FROM node:24.1.0-alpine3.20@sha256:8fe019e0d57dbdce5f5c27c0b63d2775cf34b00e3755a7dea969802d7e0c2b25 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:24.1.0-alpine3.20@sha256:8fe019e0d57dbdce5f5c27c0b63d2775cf34b00e3755a7dea969802d7e0c2b25

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
