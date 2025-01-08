FROM node:23.6-alpine3.20@sha256:58457613c94e07a83f1ded17238531c37f042acdb1499f942cf36f130705b411 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.6-alpine3.20@sha256:58457613c94e07a83f1ded17238531c37f042acdb1499f942cf36f130705b411

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
