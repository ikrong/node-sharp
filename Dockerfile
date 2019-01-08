FROM alpine:edge
WORKDIR /app

RUN set -x && \
  apk add --update --no-cache nodejs nodejs-npm

RUN set -x && \
  apk add vips-dev fftw-dev build-base python --update --no-cache \
    --repository https://alpine.global.ssl.fastly.net/alpine/edge/testing/ \
    --repository https://alpine.global.ssl.fastly.net/alpine/edge/main

RUN set -x && \
  cd /app && \
  npm set progress=false && \
  npm config set depth 0 && \
  npm i -g sharp 
