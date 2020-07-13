
FROM alpine:3.12

LABEL VERSION="0.0.1"
LABEL MAINTAINER="Poddubetskyi Volodymyr"
LABEL NAME="poddubetskyi/hw-01-docker-basics"
# Объявить использование аргументов с указанными именами
# как параметров сборки образа
ARG HOST
ARG PORT
# Присвоить используемым аргументам значения по умолчанию
# на случай, если они не переданы из командной строки
# во время сборки образа 
ARG HOST=${HOST:-"0.0.0.0"}
ARG PORT=${PORT:-8880}
# Использовать значения аргументов в качестве значений
# переменных окружения в создаваемом образе
ENV HOST=${HOST}
ENV PORT=${PORT}
# Декларировать использование порта с номером,
# переданным в аргументе с именем PORT
# как используемого в создаваемом образе
# для приема внешних соединений 
EXPOSE ${PORT}
# Определить текущий рабочий каталог образа
WORKDIR /hello_app
# Копировать файл "приложения" в текущий рабочий каталог образа
COPY [ "hello_app/hello.sh", "./" ]
# Установить подходящую версию утилиты netcat
# и добавить атрибут "исполняемый" для файла
# "приложения"
RUN apk add --no-cache netcat-openbsd && chmod +x /hello_app/hello.sh
# Команда отслеживания состояния работоспособности "приложения"
HEALTHCHECK --interval=30s --timeout=3s --start-period=3s --retries=3 \
  CMD [ "sh", "-c", "set -o pipefail ; echo healthcheck | nc -w 1 localhost ${PORT}" ]

ENTRYPOINT [ "/hello_app/hello.sh" ]
