FROM python:latest

LABEL Maintainer = "Egor Kuts"
LABEL version = 0.0.1

COPY server7001.py index.html /

EXPOSE 7001

ENTRYPOINT [ "python", "server7001.py", "7001" ]