FROM ruby:3.2.2

RUN apt-get update && apt-get install -y nodejs

WORKDIR /app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

COPY . .

RUN bundle exec rake db:setup

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
