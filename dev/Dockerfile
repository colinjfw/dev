FROM colinjfw/base:latest

ENV NODE_VERSION 12.14.0
ENV RUBY_VERSION 2.6.5
ENV PYTHON_VERSION 3.8.1
ENV GO_VERSION 1.13.4

RUN set -eux; \
  mkdir -p /usr/local/etc; \
  { \
    echo 'install: --no-document'; \
    echo 'update: --no-document'; \
  } >> /usr/local/etc/gemrc \
  && apk add \
  ruby-full=${RUBY_VERSION}-r2 \
  ruby-dev=${RUBY_VERSION}-r2 \
  nodejs=${NODE_VERSION}-r0 \
  python3=${PYTHON_VERSION}-r0 \
  go=${GO_VERSION}-r1 \
  npm \
  yarn
