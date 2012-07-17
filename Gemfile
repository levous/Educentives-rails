source 'http://rubygems.org'

gem 'rails', '3.1.0'

# templating
gem "haml"
gem "rails-boilerplate"

# authentication
gem 'sorcery'
# mocking
gem 'fabrication'

# uploader
gem 'carrierwave'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

group :devevelopment, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'debugger'
  gem 'pry'
  gem 'launchy'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'spork'
end

group :production do
  gem 'pg'
end
