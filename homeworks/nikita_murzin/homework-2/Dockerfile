FROM ubuntu:20.04

LABEL NAME = "nmurzin/dind"
LABEL MAITAINER = "Nikita Murzin"
LABEL VERSION = "0.0.1"

RUN apt-get update && apt-get install apt-transport-https ca-certificates curl software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
RUN apt install docker-ce -y

WORKDIR /app