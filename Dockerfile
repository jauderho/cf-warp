#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:6d0593ed8c0bd87111615104fd104f2cfe8e2898850d423726108c86f4fea000 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:6d0593ed8c0bd87111615104fd104f2cfe8e2898850d423726108c86f4fea000

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
