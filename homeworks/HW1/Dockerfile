FROM golang:alpine3.11 AS build

WORKDIR /src
COPY hw1.go .
RUN CGO_ENABLED=0 go build hw1.go

FROM scratch

LABEL NAME="vasylkosiv/hw1"
LABEL VERSION="0.0.1"
LABEL MAINTAINER="VasCos"

WORKDIR /hw1
COPY --from=build /src/hw1 .

ENTRYPOINT ["/hw1/hw1"]
CMD ["987654321"]