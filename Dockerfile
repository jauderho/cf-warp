FROM node:23.11.0-alpine3.20@sha256:45b0799541e0fa993516a147bd9c59a5c2b81ec06cfb8f6e6e18d222f2780e23 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.11.0-alpine3.20@sha256:45b0799541e0fa993516a147bd9c59a5c2b81ec06cfb8f6e6e18d222f2780e23

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
