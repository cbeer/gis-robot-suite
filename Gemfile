source 'https://rubygems.org'

gem 'assembly-objectfile'
gem 'config', '~> 2.0'
gem 'dor-services', '~> 8.1'
gem 'dor-services-client', '~> 5.0'
gem 'fastimage', '~> 1.7'
gem 'ffi-geos', '~> 1.0', require: false  # XXX: where is this used?
# iso-639 0.3.0 isn't compatible with ruby 2.5.  This declaration can be dropped when we upgrade to ruby 2.6
# see https://github.com/alphabetum/iso-639/issues/12
gem 'iso-639', '~> 0.2.10'
gem 'lyber-core', '~> 5.0'
gem 'pry', '~> 0.10'              # for console
gem 'rake', '~> 12.0' # stuck on 12 until https://github.com/nevans/resque-pool/pull/183 is resolved
gem 'rgeoserver', '~> 0.10'
gem 'rsolr'
gem 'slop', '~> 3.6'              # for bin/run_robot
gem 'honeybadger'
gem 'geo_combine'
gem 'net-http-persistent', '~> 3.0'
gem 'activemodel', '~> 5.1', '< 5.2'  # due to https://github.com/sul-dlss/gis-robot-suite/issues/174
gem 'resque'
gem 'resque-pool'

group :development do
  gem 'rspec'
  gem 'coveralls', require: false
  gem 'rubocop', '~> 0.52.1', require: false # avoid code churn due to rubocop changes
  gem 'rubocop-rspec'
end

group :deployment do
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'capistrano-resque-pool'
  gem 'dlss-capistrano'
  gem 'capistrano-shared_configs'
end
