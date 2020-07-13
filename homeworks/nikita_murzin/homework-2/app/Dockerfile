FROM php:7.4-alpine

COPY . /usr/src/app
WORKDIR /usr/src/app

EXPOSE 8080:8080/tcp

ENTRYPOINT [ "php" ]

CMD [ "-S",  "0.0.0.0:8080", "/usr/src/app/index.php"  ]