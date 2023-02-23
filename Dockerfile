#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:35fe1a8c4bab75d64ea30331ff2e0766f17aa6818b84221337f88f0a06ada8a6 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:35fe1a8c4bab75d64ea30331ff2e0766f17aa6818b84221337f88f0a06ada8a6

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
