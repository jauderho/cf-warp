#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:a48288382fd9a756af6512347e452e7ea6d3dfd0e3279a65e88f90f24648c4c1 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:a48288382fd9a756af6512347e452e7ea6d3dfd0e3279a65e88f90f24648c4c1

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
