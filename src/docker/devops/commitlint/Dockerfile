FROM ourchitecture/devops-node:latest

WORKDIR /tmp

# update and install general packages
RUN apt-get update \
    # clean up layer: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
    && rm -rf /var/lib/apt/lists/*

# install commitlint
RUN npm install -g \
    @commitlint/cli \
    @commitlint/config-conventional

# return to previous working directory
WORKDIR /
