# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Oraculo::Application.initialize!

require 'rubygems'

require 'bluecloth'

config.gem 'bluecloth', :version => '>=2.1.0'
