#FROM node:14-alpine3.14 AS build
FROM node:17-alpine3.15@sha256:9c9912aee7fbd2d8bc71d24c5f3fe429d6fc2411a33b93c44ac07b7978a3d397 AS build

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
