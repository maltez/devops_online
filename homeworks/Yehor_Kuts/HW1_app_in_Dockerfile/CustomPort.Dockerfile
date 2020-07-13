FROM python:latest

LABEL NAME = "kutsegor/python_server_custom_port"
LABEL VERSION = "0.0.2"
LABEL MAITAINER = "Egor Kuts"

COPY server.py index.html /
EXPOSE 7006

ENTRYPOINT [ "python", "server.py" ]
CMD [ "7006" ]