source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bourbon'
gem 'binding_of_caller'
gem 'yt'
gem 'chartkick'
gem 'chromedriver-helper'
gem 'coffee-rails'
gem 'hamlit'
gem 'highcharts-rails'
gem 'html2haml'
gem 'jbuilder'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'neat', '~>1.8'
gem 'pg'
# gem 'yt', '~>0.28.0'
gem 'puma'
gem 'rails'
gem 'refills'
gem 'rspotify'
gem 'sass-rails'
gem 'selenium-webdriver'
gem 'turbolinks'
gem 'typhoeus'
gem 'uglifier'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'spirit_hands', github: 'steakknife/spirit_hands'
  gem 'lol_dba'
end

group :development do
  gem 'better_errors'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
