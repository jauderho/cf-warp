#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:717a3d788a41347ceb43c1f65831538d75ea74a4d29dfefadb7b7246d450127c AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:717a3d788a41347ceb43c1f65831538d75ea74a4d29dfefadb7b7246d450127c

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
