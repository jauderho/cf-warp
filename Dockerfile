#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:41ef4e42ac20476e71cd49a661d34282eaa40937cadac24da951d986b7544ca3 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:41ef4e42ac20476e71cd49a661d34282eaa40937cadac24da951d986b7544ca3

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
