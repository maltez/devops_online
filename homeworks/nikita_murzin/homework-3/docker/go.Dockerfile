FROM golang:alpine3.11 AS build
WORKDIR /src
COPY ./src/go-app .
RUN CGO_ENABLED=0 go build server.go

FROM scratch
WORKDIR /server
COPY --from=build /src/server .

EXPOSE 9000
ENTRYPOINT ["/server/server"]