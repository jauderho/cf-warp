FROM node:23.3-alpine3.20@sha256:878e1090f21b55228933660a187509532b8eb295334b6efb99a32419115af640 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.3-alpine3.20@sha256:878e1090f21b55228933660a187509532b8eb295334b6efb99a32419115af640

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
