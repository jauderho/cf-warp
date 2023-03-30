#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:3ece06beaa30454f3a6eee377529e90b73c647cd0c9e0a2bfd4b02033ec12c2a AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:3ece06beaa30454f3a6eee377529e90b73c647cd0c9e0a2bfd4b02033ec12c2a

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
