FROM  alpine:latest

LABEL TAG="xine/simple-bash-webserver:latest"
LABEL VERSION="0.0.1"
LABEL MAINTAINER="LazyK"

WORKDIR /src
COPY ["http.sh", "index.html", "./"]

RUN apk update && apk --no-cache add curl netcat-openbsd
RUN chmod +x http.sh 

EXPOSE 8080

HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 CMD ["curl", "--head", "http://0.0.0.0:8080/healthy"]


ENTRYPOINT [ "./http.sh"]
