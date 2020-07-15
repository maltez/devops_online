FROM php:7.4-alpine

LABEL NAME = "nmurzin/phpinfo-app"
LABEL MAITAINER = "Nikita Murzin"
LABEL VERSION = "0.0.2"

COPY ./app /usr/src/app
WORKDIR /usr/src/app

EXPOSE 8080:8080/tcp

ENTRYPOINT [ "php" ]

CMD [ "-S",  "0.0.0.0:8080", "/usr/src/app/index.php"  ]