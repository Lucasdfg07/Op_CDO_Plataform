FROM ruby:3.0.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /op_codigo_de_ouro

COPY Gemfile /op_codigo_de_ouro/Gemfile
COPY Gemfile.lock /op_codigo_de_ouro/Gemfile.lock

RUN bundle install

COPY . /op_codigo_de_ouro

CMD ["rails", "server", "-b", "0.0.0.0"]
