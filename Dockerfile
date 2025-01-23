FROM node:23.6.1-alpine3.20@sha256:6098f8f773e6910b41e7f5b3331d499395b26a376b440b99cdd3c47c62a131a4 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.6.1-alpine3.20@sha256:6098f8f773e6910b41e7f5b3331d499395b26a376b440b99cdd3c47c62a131a4

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
