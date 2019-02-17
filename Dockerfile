FROM node:10-alpine

ARG cachePath=/tmp/npmcache

RUN npm install --global \
                --cache ${cachePath} \
                @angular/cli

RUN rm -rf ${cachePath} /tmp/npm* /root/.config
