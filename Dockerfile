#
# minimal Dockerfile to run bundler/sinatra in a docker container
#
# references:
#   https://bundler.io/v2.1/guides/bundler_docker_guide.html
#   https://dev.to/markoa/dockerize-a-sinatra-microservice-29l8
#

FROM ruby:2.7-slim
RUN apt-get update -qq && apt-get install -y build-essential

# configure bundler environment
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

# create /app
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# add Gemfile{,.lock} to /app
ADD Gemfile* $APP_HOME

# configure/run bundler
RUN bundle config set without 'development test' && bundle install

# populate app dir
ADD . $APP_HOME

# run rackup inside bundler, bind to 8080
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "8080"]
