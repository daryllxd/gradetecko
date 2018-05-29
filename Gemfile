source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'bullet', '5.7.5'
  gem 'clipboard'
  gem 'codeclimate-test-reporter', require: false
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec', '3.7.0'
  gem 'rspec-rails'
  gem 'rb-readline'
  gem 'ruby-prof', '>= 0.16.0', require: false
  gem 'pry-byebug', '3.6.0'
  gem 'pry-rails'
  gem 'spring', '~> 2.0.2'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'better_errors'
  gem 'guard-shell', '~> 0.7.1'
  gem 'lol_dba', '2.1.4'
  gem 'rails_layout'
  gem 'rubocop', '0.52.1', require: false
  gem 'ruby-growl'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'aruba', '0.14.2'
  gem 'colorize'
  gem 'database_cleaner', '~> 1.6.2'
  gem 'db-query-matchers'
  gem 'fuubar', '2.2.0'
  gem 'json_spec', '1.1.4'
  gem 'launchy'
  gem 'rspec_junit_formatter'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov'
  gem 'stackprof', '>= 0.2.9', require: false
  gem 'test-prof', '0.4.0', require: false
  gem 'timecop', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
