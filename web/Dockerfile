FROM node:23.4-alpine3.20@sha256:7bcf3a9f2f894ff2a9f699f93a969a58a0f26ad9471e40080d77ca76cd5cfe7e AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.4-alpine3.20@sha256:7bcf3a9f2f894ff2a9f699f93a969a58a0f26ad9471e40080d77ca76cd5cfe7e

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
