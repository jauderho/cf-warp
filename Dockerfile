#FROM node:14-alpine3.14 AS build
FROM node:17-alpine3.15@sha256:0f923922724e7d04a699ceb7b92b8383ec093b4e249804c8bd94886426443bff AS build

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
