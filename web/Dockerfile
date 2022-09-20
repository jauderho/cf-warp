#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:831d5eca5b7437a8132031a25bd18bdb0399e7415d4e8e02a8c14426b6dcf17f AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:831d5eca5b7437a8132031a25bd18bdb0399e7415d4e8e02a8c14426b6dcf17f

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
