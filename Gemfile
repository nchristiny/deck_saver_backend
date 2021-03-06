source 'https://rubygems.org'
gem 'dotenv-rails', :groups => [:development, :test]

# Rails 5 --api --edge
gem 'rails', github: "rails/rails"

gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Active Model Serializers
gem 'active_model_serializers', '0.8.3'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Communicate with Hearthstone API
gem 'unirest'
gem 'json'
# API rate limiting and throttling
gem 'rack-attack'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Set the rspec gems on master branch:
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
      gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'master'
  end
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'ffaker'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'awesome_print'
end

group :test do
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers', require: false
  gem 'rspec-activemodel-mocks'
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
