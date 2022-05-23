# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

group :development, :test do
  # indented print of Ruby and Rails Objs and Arrays by using `ap something
  gem 'awesome_print', '~> 1.9', '>= 1.9.2', require: 'ap'
  gem 'rspec', '~> 3.10'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  # Rspec DSL that generates Swagger files directly from your rspecs
  gem 'rswag-specs', '~> 2.4'
  gem 'rubocop', '~> 1.6', '>= 1.6.1', require: false
  gem 'rubocop-gitlab-security', '~> 0.1.1'
  gem 'rubocop-performance', '~> 1.9', '>= 1.9.1', require: false
  gem 'rubocop-rails', '~> 2.9', '>= 2.9.1', require: false
  gem 'rubocop-rspec', '~> 2.1', require: false
end

group :test do
  # gem 'rspec-sidekiq', '~> 3.1'
  gem 'shoulda-callback-matchers', '~> 1.1.4'
  gem 'shoulda-matchers', '~> 4.5', '>= 4.5.1'
  gem 'simplecov', '~> 0.21.2'
  gem 'timecop'
end

group :development do
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  # Provides a better error page for Rails and other Rack apps
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  # Static analysis tool for security vulnerabilities.
  gem 'brakeman'
  # bundler-audit provides patch-level verification for Bundled apps.
  gem 'bundler-audit', '~> 0.9.0.1'
  # Increase your application's performance by reducing the number of queries it makes.
  gem 'bullet', '~> 7.0'
  # Checks the consistency of the database constraints with the application validations
  gem 'database_consistency', '~> 1.1', '>= 1.1.1'
  # Check various places in your code that could be faster.
  gem 'fasterer', '~> 0.9.0'
  # Utility to install, configure, and extend Git hooks
  gem 'overcommit', '~> 0.58.0'
  # Code metric tool to check the quality of Rails code.
  gem 'rails_best_practices'
  # Tool that examines classes, modules and methods and reports any Code Smells it finds.
  gem 'reek'
  # Adds number of SQL queries that were done during processing request
  gem 'sql_queries_count', '~> 0.0.1'
end
