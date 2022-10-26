#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:7eaaf14ed8b7cc1d716b965bff7554d7d2e1127558ee8108d3844dc3a1122234 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:7eaaf14ed8b7cc1d716b965bff7554d7d2e1127558ee8108d3844dc3a1122234

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
