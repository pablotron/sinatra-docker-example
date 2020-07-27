require 'cgi'
require 'sinatra/base'
require 'sinatra/json'

module Hello
  #
  # Minimal modular Sinatra application that configures three routes which
  # respond to GET requests:
  #
  # * /: serves a static "hi!" page
  # * /hello: prints the user's name, if specified
  # * /json: returns some JSON
  # 
  class App < Sinatra::Base
    helpers do
      #
      # HTML-escape string.
      #
      def h(s)
        CGI.escape_html(s)
      end
    end

    get '/hello/:name' do
      'hello %<name>s' % {
        name: h(params[:name]),
      }
    end

    get '/hello' do
      'hello world'
    end

    get '/json' do
      json({
        name: params[:name],
        age: params[:age]
      })
    end

    get '/' do
      'hi!'
    end
  end
end
