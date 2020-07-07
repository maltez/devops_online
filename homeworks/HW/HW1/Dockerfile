FROM node:12

LABEL NAME="m3m3/hw1"
LABEL VESION="1.0.0"
LABEL MAINTAINER="Mihailov"


WORKDIR /usr/src/app

COPY . .

RUN npm install --no-cache

EXPOSE 8080

CMD [ "node", "server.js" ]
