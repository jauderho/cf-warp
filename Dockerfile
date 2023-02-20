#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:219d834a9d2feee315f5e43f044333adc9b65f871febd353f68302f544f76646 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:219d834a9d2feee315f5e43f044333adc9b65f871febd353f68302f544f76646

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
