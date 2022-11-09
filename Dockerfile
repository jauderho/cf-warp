#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:00c5c0850a48bbbf0136f1c886bad52784f9816a8d314a99307d734598359ed4 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:00c5c0850a48bbbf0136f1c886bad52784f9816a8d314a99307d734598359ed4

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
