FROM node:23.8.0-alpine3.20@sha256:1b4d82a2bee3b5ea9a9048bd3b326220ac77065a84cbef339a8f41c698f0ec66 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.8.0-alpine3.20@sha256:1b4d82a2bee3b5ea9a9048bd3b326220ac77065a84cbef339a8f41c698f0ec66

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
