source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'hamlit'
gem 'typhoeus'
gem 'selenium-webdriver'
gem 'chromedriver-helper'
gem 'rspotify'
gem 'bourbon'
gem 'neat', '~>1.8'
gem 'refills'
gem 'jquery-rails'
gem 'coffee-rails'
gem 'turbolinks'
gem 'jbuilder'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'spirit_hands', github: 'steakknife/spirit_hands'
end

group :development do
  gem 'better_errors'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
