FROM node:10-alpine

ARG cachePath=/tmp/npmcache

RUN apk add --no-cache \
            --update \
            chromium \
            openssh-client \
            zip \
            composer \
            php7-ctype

RUN mkdir ~/.ssh/
RUN touch ~/.ssh/config
RUN echo 'StrictHostKeyChecking no' >> ~/.ssh/config

RUN npm install --global \
                --cache ${cachePath} \
                @angular/cli
RUN rm -rf ${cachePath} /tmp/npm* /root/.config
