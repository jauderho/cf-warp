#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:566ffe130bb0fd2d03d492333ad2e9c35fcf1f2c9d8be6311b3c29d6c138802a AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:566ffe130bb0fd2d03d492333ad2e9c35fcf1f2c9d8be6311b3c29d6c138802a

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
