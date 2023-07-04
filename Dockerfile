FROM ruby:3.2.2

RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client
WORKDIR /desafio_gerenciador_provas
COPY Gemfile /desafio_gerenciador_provas/Gemfile
COPY Gemfile.lock /desafio_gerenciador_provas/Gemfile.lock
RUN bundle install

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]