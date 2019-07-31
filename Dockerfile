FROM node:10

RUN apt update && \
    \
    apt install -y \
        chromium \
        openssh-client \
        zip \
        composer \
        php-ctype && \
    \
    apt clean

RUN mkdir ~/.ssh/
RUN touch ~/.ssh/config
RUN echo 'StrictHostKeyChecking no' >> ~/.ssh/config
