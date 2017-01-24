# source 'https://gems.ruby-china.org/'
source 'https://rubygems.org/'

gem 'rails', '4.2.7.1'
gem 'mysql2', '0.4.5'
gem 'sass-rails','5.0.6'
gem 'uglifier','3.0.4'
gem 'coffee-rails','4.2.1'
gem 'therubyracer', '0.12.3', platforms: :ruby
gem 'jquery-rails','4.2.2'
gem 'turbolinks','5.0.1'
gem 'jbuilder','2.6.1'
gem 'devise','3.4.0' # User authentication
gem 'guard-livereload', '2.5.2' #automatically reloads your browser when 'view' files are modified
gem 'fume-settable','0.0.3'
gem 'faraday', '0.9.2'
gem 'to_xls-rails','1.3.1'
gem 'will_paginate','3.1.5'
gem 'cancancan','1.15.0'
gem 'puma','3.6.2'

group :development do
  gem 'spring', '2.0.0' # bin/bundle exec spring binstub --all
  gem 'capsum', '1.0.4', require: false #collect gems and recipes for capistrano
  gem 'capistrano-rails', '1.1.7'
  gem 'capistrano-rvm', '0.1.2'
  gem 'capistrano-bundler', '1.1.4'
  gem 'shoulda-matchers', '3.1.1' # provides RSpec- and Minitest-compatible one-liners that test common Rails functionality
  gem 'capistrano3-puma','1.2.1'
end

group :development, :test do
  gem 'pry-rails', '0.3.4'
  gem 'pry-byebug', '3.3.0'
end

group :test do
  gem 'rspec-rails', '3.4.2'
  gem 'factory_girl_rails', '4.6.0'
  gem 'json_spec', '1.1.4' #RSpec matchers and Cucumber steps for testing JSON content
  gem 'rspec-sidekiq', '2.2.0'
  gem 'simplecov', '0.9.2', require: false
  gem 'database_cleaner', '1.5.1'
  gem 'mocha', '1.1.0'
  gem 'minitest', '5.8.4'
  gem 'guard-rspec', '4.6.4' # automatically & intelligently launch specs when files are modified
end

group :production do
  gem 'lograge', '0.4.1'
end

