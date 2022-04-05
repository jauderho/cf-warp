#FROM node:14-alpine3.14 AS build
FROM node:17-alpine3.15@sha256:3981a6d3b7aa40192f7030f344f4e6f7ea6e932ab948e417407d6af2ca007226 AS build

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
