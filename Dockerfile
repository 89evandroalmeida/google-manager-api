FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV RAILS_VERSION 5.0.0.1

RUN gem install rails --version "$RAILS_VERSION"

ENV APP_PATH=/usr/src/google

RUN mkdir -p "$APP_PATH"  
WORKDIR "$APP_PATH"

EXPOSE 5000

ENV PORT=5000

CMD ["foreman","start"]

ADD Gemfile "$APP_PATH"/Gemfile
ADD Gemfile.lock "$APP_PATH"/Gemfile.lock
RUN bundle install --without development test

ADD ./ "$APP_PATH"

RUN RAILS_ENV=production rake db:create db:migrate
