#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:ee2abfe3336a66f7976233633484609299dc906a553079a48aaae18200ebe369 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:ee2abfe3336a66f7976233633484609299dc906a553079a48aaae18200ebe369

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
