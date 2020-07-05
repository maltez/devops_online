FROM python:latest

LABEL NAME = "kutsegor/server_python"
LABEL VERSION = "0.0.1"
LABEL MAITAINER = "Egor Kuts"

COPY server.py index.html /
EXPOSE 7001

ENTRYPOINT [ "python", "server.py" ]
CMD [ "7001" ]