FROM node:lts-alpine3.11

COPY . /app

WORKDIR /app

RUN npm link

ENTRYPOINT [ "our" ]

CMD [ "--help" ]
