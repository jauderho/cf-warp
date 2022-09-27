#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:322324522205fc63cd431d893434e2fb2c0264cdc444bd9222df096e6774d2ca AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:322324522205fc63cd431d893434e2fb2c0264cdc444bd9222df096e6774d2ca

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
