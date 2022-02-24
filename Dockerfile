#FROM node:14-alpine3.14 AS build
FROM node:17-alpine3.15@sha256:250e9a093b861c330be2f4d1d224712d4e49290eeffc287ad190b120c1fe9d9f AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:17-alpine3.15

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
