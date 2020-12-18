FROM ourchitecture/devops-ubuntu:latest

ARG NODE_MAJOR_VERSION="14"

# disable tracking
ENV YARN_ENABLE_TELEMETRY false

WORKDIR /tmp

# update and install general packages
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
        apt-get install -y --no-install-recommends \
            software-properties-common \
            apt-transport-https \
            gnupg2 \
            git-all \
            curl \
            # build-essential includes `make`
            build-essential \
    # clean up layer: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
    && rm -rf /var/lib/apt/lists/*

# install node
RUN curl -sL https://deb.nodesource.com/setup_${NODE_MAJOR_VERSION}.x | bash - \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
        apt-get install -y --no-install-recommends \
            nodejs \
    # clean up layer: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
    && rm -rf /var/lib/apt/lists/* \
    # ensure latest npm
    && npm install -g npm@latest \
    # install yarn
    && npm install -g yarn

# return to previous working directory
WORKDIR /
