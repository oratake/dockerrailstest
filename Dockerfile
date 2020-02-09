FROM ruby:2.7-alpine
ENV LANG C.UTF-8

RUN apt update -qq && apt install -y \
    build-essential \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME
