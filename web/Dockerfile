FROM node:23.9.0-alpine3.20@sha256:bd7fcef9f2e75a89181d42c3a9e9283563ee10f1ba416219871cd33d6c6d5cc5 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.9.0-alpine3.20@sha256:bd7fcef9f2e75a89181d42c3a9e9283563ee10f1ba416219871cd33d6c6d5cc5

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
