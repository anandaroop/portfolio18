source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').chomp

gem 'administrate'
gem 'aws-sdk-s3'
gem 'bootsnap', require: false
gem 'coffee-rails'
gem 'graphiql-rails', '~> 1.4.11' # https://github.com/rmosolgo/graphiql-rails/issues/58
gem 'graphql'
gem 'image_processing'
gem 'jbuilder'
gem 'mini_magick'
gem 'pg'
gem 'puma'
gem 'rails', '~> 5.2.0'
gem 'sass-rails'
gem 'shrine'
gem 'stringex'
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
  gem 'pry'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance'
end

group :development do
  gem 'listen'
  gem 'web-console'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
