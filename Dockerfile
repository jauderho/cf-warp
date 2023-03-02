#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:f5b2f5862dec95bd1d83991efe71470b31607e915b7d3495f73e078726a0ab04 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:f5b2f5862dec95bd1d83991efe71470b31607e915b7d3495f73e078726a0ab04

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
