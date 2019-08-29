source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.1"

gem "rails", "~> 5.2.3"
gem "bootstrap-sass", "3.3.7"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "config"
gem "jquery-rails"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "mailgun-rails"
gem "rubocop", "~> 0.54.0", require: false
gem "rails-i18n"
gem "i18n-js"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bcrypt", "~> 3.1.7"
gem "faker", "~> 2.1.0"
gem "carrierwave", "1.2.2"
gem "mini_magick", "4.7.0"
gem "will_paginate", "~> 3.1.7"
gem "bootstrap-will_paginate", "~> 1.0.0"
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "guard", "2.13.0"
  gem "guard-minitest", "2.4.4"
  gem "minitest", "5.10.3"
  gem "minitest-reporters", "1.1.14"
  gem "rails-controller-testing", "1.0.2"
  gem "sqlite3", "1.3.13"
end

group :production do
  gem "fog", "1.42"
  gem "pg", "0.20.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
