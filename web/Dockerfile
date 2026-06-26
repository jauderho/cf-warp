FROM node:26.4.0-alpine3.23@sha256:aa0d6534a72362ba0ab3c98b662ed680c32484e0aff8e0ce0888451085796a61 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:26.4.0-alpine3.23@sha256:aa0d6534a72362ba0ab3c98b662ed680c32484e0aff8e0ce0888451085796a61

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
