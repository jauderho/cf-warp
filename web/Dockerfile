FROM node:24.0.1-alpine3.20@sha256:3b48d62b0e3a6c31784bafefc95baedf56987c6ee8ba891c924a529e5301fe1c AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:24.0.1-alpine3.20@sha256:3b48d62b0e3a6c31784bafefc95baedf56987c6ee8ba891c924a529e5301fe1c

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
