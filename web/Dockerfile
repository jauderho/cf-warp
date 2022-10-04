#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:d4935e4a77d3a9aca897dc3610f7a9abc83732ba4075439fbdb46a517c07d81e AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:d4935e4a77d3a9aca897dc3610f7a9abc83732ba4075439fbdb46a517c07d81e

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
