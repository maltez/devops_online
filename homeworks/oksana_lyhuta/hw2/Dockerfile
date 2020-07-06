FROM jenkins/jenkins:lts

LABEL NAME="oksana/lyhuta"
LABEL VERSION="0.0.1"
LABEL MAINTAINER="olyhuta"

USER root

# Install the latest Docker CE binaries
RUN apt-get update -qq && \
    apt-get -qqy install apt-transport-https \
      ca-certificates \
      wget \
      curl \
      gnupg2 \
      software-properties-common

RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
    apt-get update && \
    sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d && \
    apt-get -y install docker-ce && \
    apt-get clean

RUN addgroup -a jenkins docker
