FROM alpine:latest

LABEL NAME="m3m3/hw2"
LABEL VERSION="1.0.0"
LABEL MAINTAINER="Mihailov"


RUN apk --no-cache add docker-cli && addgroup -S docker && adduser -S docker -G docker

USER docker

ENTRYPOINT [ "/bin/sh" ]

