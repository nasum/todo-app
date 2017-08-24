FROM ruby:2.4.1-alpine

ENV LANG ja_JP.UTF-8

RUN apk update && \
    apk upgrade && \
    apk add --update \
    zsh \
    build-base \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev

WORKDIR /tmp

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install --path vendor/bundle

RUN mkdir /app
WORKDIR /app
