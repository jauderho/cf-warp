#FROM node:14-alpine3.14 AS build
FROM node:20-alpine3.16@sha256:9deef8525f0d78ea59ab6018941095d1ba00959939224753136e18ffeaf4d801 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:20-alpine3.16@sha256:9deef8525f0d78ea59ab6018941095d1ba00959939224753136e18ffeaf4d801

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
