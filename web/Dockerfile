FROM node:23.1-alpine3.20@sha256:340cd3926b5116aae1207d6ca1e444d1009aad687c4ad37aa3afbe8a3db591d5 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:23.1-alpine3.20@sha256:340cd3926b5116aae1207d6ca1e444d1009aad687c4ad37aa3afbe8a3db591d5

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
