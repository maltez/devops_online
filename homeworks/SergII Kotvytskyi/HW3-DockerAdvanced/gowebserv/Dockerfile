FROM golang:alpine3.11 AS build
WORKDIR /src
COPY ["server.go","./"]
RUN CGO_ENABLED=0 go build server.go

FROM alpine:latest

LABEL TAG="maltez/simple-go-webserver:latest"
LABEL VERSION="0.0.1"
LABEL MAINTAINER="Nick Lototskiy"

RUN apk update && apk add curl

WORKDIR /server
COPY --from=build /src/server .

EXPOSE 9000

HEALTHCHECK --interval=12s --timeout=3s --start-period=6s --retries=2 CMD ["curl", "--head", "http://0.0.0.0:9000/healthy"]

ENTRYPOINT ["/server/server"]
