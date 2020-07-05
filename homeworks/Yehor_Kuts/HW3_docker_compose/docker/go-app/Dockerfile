FROM golang:alpine3.11 AS build

LABEL NAME = "kutsegor/server_go"
LABEL VERSION = "0.0.1"
LABEL MAITAINER = "Egor Kuts"

WORKDIR /src
COPY . .
RUN CGO_ENABLED=0 go build server.go

FROM scratch
WORKDIR /server
COPY --from=build /src/server .

EXPOSE 9000
ENTRYPOINT ["/server/server"]