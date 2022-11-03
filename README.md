# README

This is an example Rails application using [Grape](https://github.com/ruby-grape/grape) to define the API endpoints.
Please see Gemfile for more details on requirements.

## Installation

- `bundle install`
- `rake db:migrate db:test:prepare`
- `rake db:populate_sample_data`
- `bundle exec rspec spec`
- `rails s`
- Go to http://localhost:3000

### Using docker

In case you prefer to run the commands inside a docker container instead of on you host computer,
these commands should get you started:

First you need to build the image:
```
docker build -t rubyapp .
```

Once this is completed, you can run the rspec tests:
```
docker run --volume "$PWD":/app:Z rubyapp bundle exec rspec
```

Alternatively you can also launch an interactive bash shell and execute the rspec tests from inside
the container:
```
docker run -it --volume "$PWD":/app:Z rubyapp bash
```

To run the server, use the following command:
```
docker run --volume "$PWD":/app:Z -p 3000:3000 rubyapp
```
