FROM node:23.3-alpine3.20@sha256:003f9b956230ceea532bfe67174c4ba3a91a36884338d75626ea3d0371693577 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.3-alpine3.20@sha256:003f9b956230ceea532bfe67174c4ba3a91a36884338d75626ea3d0371693577

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
