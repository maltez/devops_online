# Простой "веб-сервер" с использованием утилиты netcat
FROM alpine:3.12

LABEL VERSION="0.0.1"
LABEL MAINTAINER="Poddubetskyi Volodymyr"
LABEL NAME="poddubetskyi/hw-01-docker-basics"

ENV HOST="0.0.0.0"
ENV PORT="8880"

# Установка netcat: https://github.com/subfuzion/docker-netcat/blob/master/Dockerfile
RUN apk add --no-cache netcat-openbsd

WORKDIR /hello_app

COPY [ "hello_app/hello.sh", "./" ]

RUN ["chmod", "+x", "/hello_app/hello.sh"]

EXPOSE ${PORT}

ENTRYPOINT [ "/hello_app/hello.sh" ]
# Собрать образ: docker build --rm --file Dockerfile --tag poddubetskyi/hw-01-docker-basics:0.0.1 .
# Запустить образ: docker run --name hw-01 --publish 8880:8880 poddubetskyi/hw-01-docker-basics:0.0.1
# Протестировать из терминала хост-компьютера: printf "\r\n" | nc 127.0.0.1 8880
# Протестировать в браузере: http://127.0.0.1:8880
# Подключиться к консоли контейнера: docker exec --interactive --tty hw-01 /bin/sh
# Остановить контейнер: docker stop hw-01
# Удалить контейнер: docker container rm hw-01
