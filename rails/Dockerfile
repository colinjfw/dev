FROM colinjfw/base:latest

ENV RUBY_VERSION 2.6.5
ENV NODE_VERSION 12.14.0

# Ruby plus additional packages common in rails projects.
RUN set -eux; \
  mkdir -p /usr/local/etc; \
  { \
    echo 'install: --no-document'; \
    echo 'update: --no-document'; \
  } >> /usr/local/etc/gemrc \
  && apk add \
  gmp-dev \
  libatomic \
  readline \
  readline-dev \
  libxml2 \
  libxml2-dev \
  libxml2-utils \
  ncurses-terminfo-base \
  ncurses-terminfo \
  libxslt \
  libxslt-dev \
  zlib-dev \
  zlib \
  yaml \
  yaml-dev \
  libffi-dev \
  build-base \
  imagemagick \
  imagemagick-dev \
  gcc \
  g++ \
  libffi-dev \
  libgcrypt-dev \
  ruby-dev=${RUBY_VERSION}-r2 \
  ruby-full=${RUBY_VERSION}-r2 \
  nodejs=${NODE_VERSION}-r0 \
  npm \
  yarn
