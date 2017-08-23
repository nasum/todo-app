FROM ruby:2.4.1-alpine

ENV LANG ja_JP.UTF-8

RUN apk update && \
    apk upgrade && \
    apk add --update \
    zsh \
    build-base \
    libxml2-dev \
    libxslt-dev \
    libpq
RUN bundle config build.nokogiri --use-system-libraries

WORKDIR /tmp

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --path vendor/bundle

COPY package.json package.json
COPY yarn.lock yarn.lock
RUN yarn install

RUN mkdir /app
WORKDIR /app

ENTRYPOINT ["prehook", "rm -f tmp/pids/server.pid", "--"]

CMD ["rails", "server", "-b", "0.0.0.0"]
