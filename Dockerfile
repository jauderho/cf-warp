#FROM node:14-alpine3.14 AS build
FROM node:17-alpine3.15@sha256:787f03b9c8fa9942e98707053b02ea5e390d770a47ec0959a45adb0e277454fb AS build

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
