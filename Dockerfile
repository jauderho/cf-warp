FROM node:24.0.2-alpine3.20@sha256:3ce0ee44c2aa0ef436a24241ce25c590ae457b915ef840b1a423653419e8fc3e AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:24.0.2-alpine3.20@sha256:3ce0ee44c2aa0ef436a24241ce25c590ae457b915ef840b1a423653419e8fc3e

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
