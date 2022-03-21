#FROM node:14-alpine3.14 AS build
FROM node:17-alpine3.15@sha256:1ef397a038d809785a1f787de87fbb496d10ee1b0565068289da1c5cac0d1fe4 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:17-alpine3.14

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
