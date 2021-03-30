source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "activerecord"
gem "rake", "~> 13.0"
gem "pry", "~> 0.14.0"
gem "sinatra-activerecord"
gem "require_all", "~> 3.0"
gem "shotgun", "~> 0.9.2"
gem "sinatra", "~> 2.1"
gem "bcrypt", "~> 3.1"
gem 'rack-flash3'
gem 'httparty'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
end