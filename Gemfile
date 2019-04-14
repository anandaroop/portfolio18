source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'administrate'
gem 'aws-sdk-s3'
gem 'bootsnap', require: false
gem 'coffee-rails'
gem 'graphiql-rails'
gem 'graphql'
gem 'image_processing'
gem 'jbuilder'
gem 'mini_magick'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma'
gem 'rails', '~> 5.2.0'
gem 'sass-rails'
gem 'shrine'
gem 'uglifier'
gem 'webpacker', '~> 4.x'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'fabrication'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end
