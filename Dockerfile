FROM ubuntu:22.04

RUN apt update && \
  apt install -y \
  gnupg \
  software-properties-common \
  curl && \
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  apt update && apt install -y terraform