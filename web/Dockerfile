FROM node:23.6-alpine3.20@sha256:6977602e02b3fee978f5927afbcc2f8990966c18838cf6bcd067373e2462ad65 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.6-alpine3.20@sha256:6977602e02b3fee978f5927afbcc2f8990966c18838cf6bcd067373e2462ad65

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
