#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.15@sha256:7ab82182ec72ea2042e29f40fd2d7badf3023302928600803e2c158be85aee94 AS build

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
