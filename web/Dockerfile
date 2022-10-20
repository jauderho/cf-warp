#FROM node:14-alpine3.14 AS build
FROM node:19-alpine3.16@sha256:48e43334c84762aa05c18dac37ec5ca396e9d55c5cb053f15cd4edbfe89a0914 AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

#FROM gcr.io/distroless/nodejs:14
FROM node:19-alpine3.16@sha256:48e43334c84762aa05c18dac37ec5ca396e9d55c5cb053f15cd4edbfe89a0914

WORKDIR /app
COPY --from=build /app .

ENV PORT=8080
EXPOSE 8080

CMD ["index.js"]
