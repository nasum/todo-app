FROM ruby:2.4.1-alpine

ENV LANG ja_JP.UTF-8

RUN apk update && \
    apk upgrade && \
    apk add --update \
    curl \
    make \
    zsh \
    build-base \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
    python \
    linux-headers \
    paxctl \
    tzdata

WORKDIR /tmp

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install

RUN curl -sSLO https://nodejs.org/dist/v8.4.0/node-v8.4.0.tar.xz && tar -xf node-v8.4.0.tar.xz

RUN cd node-v8.4.0 && \
    ./configure --prefix=/usr && \
    make install

RUN npm install -g yarn

COPY package.json package.json
COPY yarn.lock yarn.lock

RUN mkdir /app
WORKDIR /app
