FROM docker.pkg.github.com/ourchitecture/patterns-and-tutorials/devops-ubuntu:latest

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

# install azure cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# install terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn apt-key add - \
    && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
        apt-get install -y --no-install-recommends \
            terraform \
    # clean up layer: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
    && rm -rf /var/lib/apt/lists/*

# return to previous working directory
WORKDIR /
