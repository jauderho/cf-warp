FROM node:23.6.1-alpine3.20@sha256:dd3250c7d36069dfcdc4864887085a057d781dfedb8ba2467ef97f34ceee260a AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.6.1-alpine3.20@sha256:dd3250c7d36069dfcdc4864887085a057d781dfedb8ba2467ef97f34ceee260a

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
