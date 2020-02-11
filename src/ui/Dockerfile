FROM ruby:2.5.0-alpine

RUN apk --update add --no-cache gcc make g++ zlib-dev

ENV APP_HOME /app

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

RUN bundle install

ADD . $APP_HOME

ENV POST_SERVICE_HOST post

ENV POST_SERVICE_PORT 5000

ENV COMMENT_SERVICE_HOST comment

ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
