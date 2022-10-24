# Requiring Gems
require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)

# Call the controller.rb files
require 'controller'

# Call the server to launch the app
run ApplicationController
