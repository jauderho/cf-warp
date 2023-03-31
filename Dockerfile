#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:45e3f9aa6dcf7c814fbb3f23097d412792326c26f849f26fbd128f6a9d6222f8 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:45e3f9aa6dcf7c814fbb3f23097d412792326c26f849f26fbd128f6a9d6222f8

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
