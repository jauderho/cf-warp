FROM node:26.3.1-alpine3.23@sha256:d1f2956a218f864a8667d0c3f30ca52ed64f488e523a43399bc92de325046476 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:26.3.1-alpine3.23@sha256:d1f2956a218f864a8667d0c3f30ca52ed64f488e523a43399bc92de325046476

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
