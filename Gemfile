source 'https://rubygems.org'

# ensures correct ruby version for this code is used, requires lastest bundler as of April 5, 2013.
ruby '1.9.3'

gem 'rails', '3.2.13'

gem 'paper_trail', '~> 2'

gem 'simple_form' # form data layout building.
gem "haml"
gem "haml-rails"

group :development, :test do
  gem 'mysql2'
end

group :production do
  gem 'pg' # for Heroku.
end

gem 'pry', :group => :development # IRB style debugger

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass'
  # Bootstrap can use sass syntax instead of Less.
  gem 'twitter-bootstrap-rails'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0' # requires Ruby > 1.9.3

gem "rspec-rails", :group => [:test, :development]
gem "simplecov", :require => false, :group => :test
group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
  gem "spork", "> 0.9.0.rc"
  gem 'vcr'
  gem 'fakeweb'
  gem 'capybara-mechanize'
  gem 'sqlite3'
end




