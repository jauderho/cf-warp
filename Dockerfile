FROM node:23.6-alpine3.20@sha256:f4ab7927786d95893eb4f21325ebbee813fa9229cb636ee2728f7120e1b7730a AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.6-alpine3.20@sha256:f4ab7927786d95893eb4f21325ebbee813fa9229cb636ee2728f7120e1b7730a

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
