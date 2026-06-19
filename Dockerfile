FROM node:26.3.1-alpine3.23@sha256:bead114a5f13c3f193e6278d28bc10a3e0cd464cb1c764c1abac79b1cc15f64f AS build

WORKDIR /app
COPY package.json .
RUN yarn
COPY . .

# ----------------------------------------------------------------------------

FROM node:26.3.1-alpine3.23@sha256:bead114a5f13c3f193e6278d28bc10a3e0cd464cb1c764c1abac79b1cc15f64f

WORKDIR /app
COPY --from=build /app .

#ENTRYPOINT ["/nodejs/bin/node", "cli.js"]
ENTRYPOINT ["node", "cli.js"]
