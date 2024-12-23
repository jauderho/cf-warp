FROM node:23.5-alpine3.20@sha256:0e5b53891ddbf3c4924077990f037ff55d981d030648345574cd1cb0e4a524bb AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.5-alpine3.20@sha256:0e5b53891ddbf3c4924077990f037ff55d981d030648345574cd1cb0e4a524bb

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
