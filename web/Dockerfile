#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:38f184d0c4fb07836f9408af0f6b493c54da862f49532ab9ca8d282488587749 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:38f184d0c4fb07836f9408af0f6b493c54da862f49532ab9ca8d282488587749

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
