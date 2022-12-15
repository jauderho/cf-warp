#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:88df4b380b0f201056e3be8ec25db87f0fc44324bbe246428fae2fe59290779f AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:88df4b380b0f201056e3be8ec25db87f0fc44324bbe246428fae2fe59290779f

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
