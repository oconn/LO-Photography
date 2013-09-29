source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0'
# Sass-powered version of Bootstrap, ready to drop right into your Sass powered applications.
gem 'bootstrap-sass', '2.3.2.0'
# An easy way to keep your users' passwords secure.
gem 'bcrypt-ruby', '~> 3.0.0'
# Pagination library that integrates with Ruby on Rails, Sinatra, Merb, DataMapper and Sequel.
gem 'will_paginate', '3.0.4'
# Image attachment libery using ImageMagick
gem 'paperclip', '~> 3.0'
# Redcarpet is Ruby library for Markdown processing.
gem 'redcarpet'
# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/].
gem 'pg', '~> 0.17.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'
# Used for user authentication
gem "devise", "~> 3.1.0"


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :development, :test do
	# Rspec rails is a testing framework for Rails 3.x and 4.x.
  gem 'rspec-rails', '2.13.1'
  # RSpec guard allows to automatically & intelligently launch specs when files are modified.
  gem 'guard-rspec', '2.5.0'
  # This plugin is for running spork in Ruby-on-Rails applications.
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  #Guard::Spork allows to automatically & intelligently start/reload your RSpec/Cucumber/Test::Unit Spork server(s).
  gem 'guard-spork', '1.5.0'
  # This gem aims at being a simple and reliable solution for controlling external programs running in the background on any Ruby / OS combination.
  gem 'childprocess', '0.3.6'
  # Breakman is a gem to check the security flaws in your application.
  gem 'brakeman'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.0'
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'growl', '1.0.3'
  gem 'debugger'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development