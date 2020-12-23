FROM ourchitecture/devops-ubuntu:latest

ARG NODE_MAJOR_VERSION="14"

# disable tracking
ENV YARN_ENABLE_TELEMETRY false

WORKDIR /tmp

# update packages
RUN apt-get update

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
