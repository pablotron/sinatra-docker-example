#
# hello.rb configuration (used by rackup)
# 

# load bundler
require 'rubygems'
require 'bundler'

# load dependencies
Bundler.require

# load app
require_relative './hello.rb'

# run app
run Hello::App
