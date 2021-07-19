FROM node:16-alpine AS build
WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

FROM gcr.io/distroless/nodejs:14
WORKDIR /app
COPY --from=build /app .
ENV PORT=8080
EXPOSE 8080
CMD ["index.js"]
