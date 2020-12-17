ARG OS_VERSION="20.04"

FROM ubuntu:${OS_VERSION}

# This flag serves as an indicator that an environment
# is "controlled" and "safe". For example, "makefile"
# scripts will check for this flag; if it does not exist
# it will execute the same command within a docker image.
# This can improve consistency across machines for DevOps
# automation tasks (e.g. CI/CD) as well as for engineers.
ENV OUR_SAFETY=true

WORKDIR /tmp

# update and install general packages
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
        apt-get install -y --no-install-recommends \
            software-properties-common \
            apt-transport-https \
            ca-certificates \
            gnupg2 \
            gnupg-agent \
            git-all \
            curl \
            # build-essential includes `make`
            build-essential \
    # clean up layer: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
    && rm -rf /var/lib/apt/lists/*

# install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn apt-key add - \
    && apt-key fingerprint 0EBFCD88 \
    && add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
        apt-get install -y --no-install-recommends \
            docker-ce \
            docker-ce-cli \
            containerd.io \
    && rm -rf /var/lib/apt/lists/*

# return to previous working directory
WORKDIR /
