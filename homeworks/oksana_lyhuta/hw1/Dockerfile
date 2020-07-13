FROM node:10-alpine

LABEL NAME = "oksana/simple-node-server"
LABEL VERSION="0.0.1"
LABEL MAINTAINER="Oksana Lyhuta"

RUN apk add curl

WORKDIR /app
COPY ["index.js", "package.json", "./"]

RUN npm install

COPY . /app

EXPOSE 8083

HEALTHCHECK CMD curl --fail http://localhost:8083/ || exit 1

CMD [ "node", "index.js" ]
