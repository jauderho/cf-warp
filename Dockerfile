#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:f69f0ebb6343f4559f68747bdd113f6685fb2f19a4c978cdd467b334a05b3203 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:f69f0ebb6343f4559f68747bdd113f6685fb2f19a4c978cdd467b334a05b3203

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
