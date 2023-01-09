#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:4ceb1b89ced8c3f8098ccc26039be8ebf43f102cd7c4f0d76b46a37c61b345e8 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:4ceb1b89ced8c3f8098ccc26039be8ebf43f102cd7c4f0d76b46a37c61b345e8

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
