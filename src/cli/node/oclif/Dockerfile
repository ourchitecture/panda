FROM ourchitecture/devops-node:latest

# update
RUN apt-get update \
    # clean up layer: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
    && rm -rf /var/lib/apt/lists/*

COPY . /our-cli

WORKDIR /our-cli

RUN npm link

ENTRYPOINT [ "our" ]

CMD [ "--help" ]
