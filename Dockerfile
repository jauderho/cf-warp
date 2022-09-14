#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:cf40424687c3bb932a34ab852198ed4df96eca0b052b61b0ddf43f5fd9684bde AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:cf40424687c3bb932a34ab852198ed4df96eca0b052b61b0ddf43f5fd9684bde

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
