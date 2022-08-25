#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:9b435939937b0deef5c1f6fcfd1f265aa7a77574388b671fda322e662744472d AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:9b435939937b0deef5c1f6fcfd1f265aa7a77574388b671fda322e662744472d

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
