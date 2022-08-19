#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:0738685cff8a6bbace6a8f308986729e9b31b07083de252d3b2a321473f99089 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:0738685cff8a6bbace6a8f308986729e9b31b07083de252d3b2a321473f99089

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
