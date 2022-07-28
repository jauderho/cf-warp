#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:02009de840e80a6d810724021a6c4512b321c3f36eaa06f1546c400bc49a8fa0 AS build

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
