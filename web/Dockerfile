#FROM node:14-alpine3.14 AS build
FROM node:18-alpine3.16@sha256:7e68e0ab5f106662b4f3a812ebc96548e2fd7880cb8e7d9600de2361ea1eab9a AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:18-alpine3.16@sha256:7e68e0ab5f106662b4f3a812ebc96548e2fd7880cb8e7d9600de2361ea1eab9a

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
