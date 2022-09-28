FROM ubuntu:22.04

ENV TERRAFORM_VERZION 1.2.8
ENV ANSIBLE_VERSION 6.3.0
ENV DOCKER_COMPOSE 1.29.2
ENV DOCKER_ENGINE 6.0.0

RUN apt-get update && \
    apt-get install -y \
    gnupg \
    software-properties-common \
    curl \
    ca-certificates \
    apt-transport-https \
    lsb-release \
    gnupg \
    git \
    python3-pip && \
  echo "Install terraform ${TERRAFORM_VERZION}" && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && apt-get install -y terraform=${TERRAFORM_VERZION} && \
  echo "Python3 dependencies" && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip; fi && \
    if [ ! -e /usr/bin/python ]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
  echo "Install ansible" && \
    pip --no-cache-dir install \
      ansible==${ANSIBLE_VERSION} \
      docker==${DOCKER_ENGINE} \
      docker-compose==${DOCKER_COMPOSE} && \
  echo "Install Azure CLI" && \
    pip --no-cache-dir install azure-cli && \
  echo "Install Aws CLI" && \
    pip --no-cache-dir install awscli && \
  echo "Install Gcp cli" && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    apt-get update && apt-get install google-cloud-sdk && \
  apt-get clean