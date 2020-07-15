FROM node:12-alpine

ARG PASSWD="Password is empty, because you must buil image with --build-arg PASSWD=$(./get_key.sh)"
ENV PASS=$PASSWD

LABEL NAME="m3m3/hw7"
LABEL VESION="1.0.0"
LABEL MAINTAINER="Mihailov"


WORKDIR /usr/src/app

COPY . .

RUN npm install --no-cache

EXPOSE 8080

CMD [ "node", "server.js" ]
