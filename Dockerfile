#FROM node:14-alpine3.14 AS build
FROM node:17-alpine3.15@sha256:f61706c2cb120c06cf4fdcf60a2822a804b0bd90b6b2209be1ee00db1d33130c AS build

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
