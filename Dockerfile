#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:5f9dc9d8b5e53b9b568c1f222be416b1258b6277063df7bbaa2c80be07e6a96b AS build

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
