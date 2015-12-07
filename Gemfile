source 'https://rubygems.org'
ruby '2.1.5'
gem 'rails', '4.2.0'
gem 'mysql2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'kaminari' # adds pagination to ActiveModels
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'carmen-iso-4217' # Adds a currency_code method
gem 'responders', '~> 2.0'
gem 'skim' # templating engine with embedded CoffeeScript

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

gem 'bootstrap-sass'
gem 'bootstrap-datepicker-rails' # for select birth date
gem 'high_voltage'

group :development do
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'dotenv-rails'  # setup ENV variable 
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
