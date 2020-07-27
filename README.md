# Sinatra Docker Example

## Overview

Minimal [Sinatra][] application configured to run in a [Docker][]
container.

This repository contains the following files:

* `hello.rb`: Minimal modular [Sinatra][] application
* `Gemfile`: [Bundler][] configuration.
* `config.ru`: [Rack][] configuration for [rackup][].
* `Dockerfile`: [Docker][] image configuration.

## Usage

To build the image:

```
# build image tagged "sinatra-docker-example" from the contents of this
# repository
docker build -t sinatra-docker-example .
```

To run the image:

```
# run image in detached, transient container, and forward port 4323 to
# port 8080 inside the container
docker run --rm -d -p 4323:8080 sinatra-docker-example
```

## References

* <https://bundler.io/v2.1/guides/bundler_docker_guide.html>
* <https://dev.to/markoa/dockerize-a-sinatra-microservice-29l8>

[sinatra]: http://sinatrarb.com/
  "Ruby web microframework."
[docker]: https://docker.com/
  "Docker container manager."
[bundler]: https://bundler.io/
  "Ruby dependency manager."
[rackup]: https://github.com/rack/rack/wiki/(tutorial)-rackup-howto
  "Command-line tool to run Rack applications."
[rack]: https://github.com/rack/rack
  "Ruby web middleware."
