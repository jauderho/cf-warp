#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.15@sha256:505bb54d5a7380b805d68db9822dd20844c0d348f4f96ccc57e1a240cba57236 AS build

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
