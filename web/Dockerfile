#FROM node:14-alpine3.14 AS build
FROM node:20-alpine3.16@sha256:92f5b6d68daf68d08c4def4b8775cee8de9bdeec2fc1cd73d2d235022cd6ef05 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:20-alpine3.16@sha256:92f5b6d68daf68d08c4def4b8775cee8de9bdeec2fc1cd73d2d235022cd6ef05

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
