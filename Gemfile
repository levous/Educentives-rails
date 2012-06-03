source 'http://rubygems.org'

gem 'rails', '3.1.0'

# templating
gem "haml"

# authentication
gem 'sorcery'

gem 'fabrication', git: 'git://github.com/paulelliott/fabrication.git', branch: 'v2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

group :dev, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'debugger'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'factory_girl_rails'
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'spork'
  gem 'launchy'
end

group :production do
  gem 'pg'
end
