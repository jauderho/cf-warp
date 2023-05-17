#FROM node:14-alpine3.14 AS build
FROM node:20-alpine3.16@sha256:f9b54b46639a9017b39eba677cf44c8cb96760ca69dadcc1d4cbd1daea753225 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:20-alpine3.16@sha256:f9b54b46639a9017b39eba677cf44c8cb96760ca69dadcc1d4cbd1daea753225

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
