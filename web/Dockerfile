#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:2ece80175df95b3730ea35f5d0922417fed7093779ca2009cbbf96ea3cd6a588 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:2ece80175df95b3730ea35f5d0922417fed7093779ca2009cbbf96ea3cd6a588

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
