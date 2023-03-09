#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:36a9713993ecd9c602084f9d3da715626c6354a7d8979bff7ae0d92a75ffe1ab AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:36a9713993ecd9c602084f9d3da715626c6354a7d8979bff7ae0d92a75ffe1ab

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
