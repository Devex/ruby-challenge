FROM ruby:2.7.2

RUN apt-get update && apt-get install -y nodejs

WORKDIR /app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

COPY . .

RUN bundle exec rake db:migrate db:test:prepare

RUN bundle exec rake db:populate_sample_data

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
