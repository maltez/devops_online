FROM php:7.4-alpine

LABEL NAME = "nmurzin/phpinfo-app"
LABEL MAITAINER = "Nikita Murzin"
LABEL VERSION = "0.0.1"

COPY ./app /usr/src/homework-01
WORKDIR /usr/src/homework-01

EXPOSE 8080:8080/tcp

ENTRYPOINT [ "php" ]

CMD [ "-S",  "0.0.0.0:8080", "/usr/src/homework-01/index.php"  ]