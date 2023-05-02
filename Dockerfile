# Dockerfile

FROM ruby:2.7.6

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs yarn

RUN mkdir /pets_portal
WORKDIR /pets_portal

COPY Gemfile /pets_portal/Gemfile
COPY Gemfile.lock /pets_portal/Gemfile.lock

RUN bundle install
RUN gem install rails

COPY . /pets_portal