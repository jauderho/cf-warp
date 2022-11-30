#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:80844b6643f239c87fceae51e6540eeb054fc7114d979703770ec75250dcd03b AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:80844b6643f239c87fceae51e6540eeb054fc7114d979703770ec75250dcd03b

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
