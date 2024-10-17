FROM node:23.0-alpine3.20@sha256:66fc75e0b8c49a4a0ab647743fde584a5e5ddefc77b7e9113fdc8932a08c323b AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.0-alpine3.20@sha256:66fc75e0b8c49a4a0ab647743fde584a5e5ddefc77b7e9113fdc8932a08c323b

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
