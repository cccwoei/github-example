FROM node:18.17-alpine AS build
WORKDIR /app
COPY ./src/package.json .
RUN npm install --only=prod

COPY ./src  .

FROM node:18.17-alpine
WORKDIR /app
COPY --from=build /app .
EXPOSE 8080
ENTRYPOINT ["npm","start"]
