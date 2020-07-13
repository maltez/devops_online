FROM jenkins/jenkins:lts

LABEL NAME="xine/jenkins-dind"
LABEL VERSION="0.0.1"
LABEL MAINTAINER="LazyK"

USER root
RUN apt-get update -qq && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install docker-ce docker-ce-cli containerd.io -y && \
    rm -rf /var/lib/apt/lists/* && \
    usermod -aG docker jenkins
