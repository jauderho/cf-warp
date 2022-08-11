#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:8da3d86c911f91712b41e0b2329f7e95e8ee27b9facc5c663d5e5f91ad5e7cad AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:8da3d86c911f91712b41e0b2329f7e95e8ee27b9facc5c663d5e5f91ad5e7cad

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
