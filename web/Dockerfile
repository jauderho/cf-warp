#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:f829c27f4f7059609e650023586726a126db25aded0c401e836cb81ab63475ff AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:f829c27f4f7059609e650023586726a126db25aded0c401e836cb81ab63475ff

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
