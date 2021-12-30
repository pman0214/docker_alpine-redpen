# Copyright (c) 2021 Shigemi ISHIDA
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM alpine:3.13
ARG VER=1.10.4

ENV PATH="/usr/local/redpen/bin:${PATH}"

COPY files /tmp/files

RUN set -x && \
  apk update && \
  apk add --no-cache openjdk8 && \
  apk add --no-cache --virtual .fetch-deps curl && \
  mkdir -p /usr/local/redpen && \
  curl -L https://github.com/redpen-cc/redpen/releases/download/redpen-${VER}/redpen-${VER}.tar.gz | \
    tar zx -C /usr/local/redpen --strip-components=1 && \
  cp /tmp/files/* /usr/local/redpen/ && \
  apk del --purge .fetch-deps && \
  rm -rf /tmp/files && \
  rm -rf /var/cache/apk && \
  mkdir /var/cache/apk

WORKDIR /app
CMD ["sh"]
