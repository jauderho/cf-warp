FROM node:23.5-alpine3.20@sha256:afe1d673fc9a75ab625646f8d087dd490d267311a3983df66815ee3e120b1813 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.5-alpine3.20@sha256:afe1d673fc9a75ab625646f8d087dd490d267311a3983df66815ee3e120b1813

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
