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
            gnupg2 \
            git-all \
            curl \
            # build-essential includes `make`
            build-essential \
    # clean up layer: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
    && rm -rf /var/lib/apt/lists/*

# return to previous working directory
WORKDIR /
