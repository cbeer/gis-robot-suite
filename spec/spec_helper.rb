# Make sure specs run with the definitions from local.rb
ENV['ROBOT_ENVIRONMENT'] ||= 'test'

require 'coveralls'
require 'simplecov'
require 'webmock/rspec'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  track_files 'bin/**/*'
  track_files 'lib/**/*.rb'
  track_files 'robots/**/*.rb'
  add_filter '/spec/'
end
Coveralls.wear!

require_relative '../config/boot'

require 'pry'
require 'rspec'
