FROM python:latest
COPY . /
ENTRYPOINT [ "python" ]
CMD [ "server.py" ]