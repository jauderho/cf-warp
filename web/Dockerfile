#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:e479d86de1ef8403adda6800733a7f8d18df4f3c1c2e68ba3e2bc05fdea9de20 AS build

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
