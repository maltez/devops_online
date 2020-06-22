FROM python:latest

LABEL Maintainer = "Egor Kuts"
LABEL version = 0.0.1

COPY server.py index.html /

ENTRYPOINT [ "python", "server.py" ]