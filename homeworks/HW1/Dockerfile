FROM golang:alpine3.11

LABEL NAME="vasylkosiv/hw1"
LABEL VERSION="0.0.1"
LABEL MAINTAINER="VasCos"

WORKDIR /src
COPY . .
RUN CGO_ENABLED=0 go build hw1.go

ENTRYPOINT ["/src/hw1"]
CMD ["987654321"]