#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:1fd6846cfed166b9347218b9f3d6ac7cc6ea27ba7b9a2ba288446577de00c29f AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:1fd6846cfed166b9347218b9f3d6ac7cc6ea27ba7b9a2ba288446577de00c29f

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
