FROM python:latest

LABEL NAME = "kutsegor/python_server_default_port"
LABEL VERSION = "0.0.2"
LABEL MAITAINER = "Egor Kuts"

COPY server7001.py index.html /
EXPOSE 7001

HEALTHCHECK --interval=30s --timeout=30s \
  CMD curl -f http://localhost:7001/ || exit 1

ENTRYPOINT [ "python" ]
CMD [ "server7001.py" ]