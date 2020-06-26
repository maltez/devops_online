FROM jenkins/jenkins:lts

LABEL NAME="ikote/dind"
LABEL VERSION="0.0.2"
LABEL MAINTAINER="iKote"

USER root

RUN cd /usr/local/bin && \
curl https://master.dockerproject.org/linux/amd64/docker > docker && \
chmod +x docker && \
groupadd -g 999 docker && \
usermod -a -G docker jenkins

USER jenkins
