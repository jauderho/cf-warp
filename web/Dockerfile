#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:bdd47da7e6d246549db69891f5865d82dfc9961eae897197d85a030f254980b1 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:bdd47da7e6d246549db69891f5865d82dfc9961eae897197d85a030f254980b1

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
