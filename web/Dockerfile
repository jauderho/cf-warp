#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.15@sha256:f55132b48261c7ca0394d71c204eb419db0a0209be341762390693434e4bdd92 AS build

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
