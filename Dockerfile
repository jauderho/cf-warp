#FROM node:14-alpine3.14 AS build
FROM node:17-alpine3.15@sha256:0e83c810225bc29e614189acf3d6419e3c09881cefb9f7a170fdcfe3e15bbfd5 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:17-alpine3.15

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
