FROM alpine:3.10.0

RUN apk update && apk add iputils

ENTRYPOINT [ "ping" ]
CMD [ "google.com" ]