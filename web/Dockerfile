#FROM node:14-alpine3.14 AS build
FROM node:20-alpine3.16@sha256:ed99329fe58da7a80ae65cf047414c578aadb4799fc270b94e7c2c92c88086bb AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:20-alpine3.16@sha256:ed99329fe58da7a80ae65cf047414c578aadb4799fc270b94e7c2c92c88086bb

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
