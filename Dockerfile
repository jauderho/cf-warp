#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:2241dcb089d4d46d9321cc69f67769f741a04b08c9ead1530e8054d7eaac97a5 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:2241dcb089d4d46d9321cc69f67769f741a04b08c9ead1530e8054d7eaac97a5

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
