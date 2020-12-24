FROM ourchitecture/devops-ubuntu:latest

ENV JAVA_HOME=/usr/java/openjdk/jdk-15.0.1
ENV PATH=$PATH:$HOME/bin:$JAVA_HOME/bin

WORKDIR /tmp

# update packages
RUN apt-get update \
    # clean up layer: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
    && rm -rf /var/lib/apt/lists/*

# install java
RUN mkdir -p /usr/java/openjdk \
    && cd /usr/java/openjdk \
    && curl -sL https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_linux-x64_bin.tar.gz | tar xvz \
    && rm -f openjdk-15.0.1_linux-aarch64_bin.tar.gz

# return to previous working directory
WORKDIR /

ENTRYPOINT [ "java" ]
CMD [ "-version" ]
