#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:cd8f5b451e927f3c5c92016cfaf9d6805999faeded64486d8f76c9d4ef6f1b5c AS build

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
