#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:35c22fc0c7b39912a929e5cfe21a29d337268de2b927374400e6b43884e8e348 AS build

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
