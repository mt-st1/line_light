source 'https://rubygems.org'

ruby '2.6.5'

gem 'rails',        '5.0.3'
gem 'puma',         '3.12.4'
gem 'sass-rails',   '5.0.6'
gem 'uglifier',     '3.2.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'jquery-ui-rails'
gem 'turbolinks',   '5.0.1'
gem 'jbuilder',     '2.7.0'
gem 'will_paginate',  '3.1.5'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass', '3.4.1'

gem 'slim-rails'
gem 'html2slim'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'cancancan'
gem 'rails_admin'
gem 'data-confirm-modal'
gem 'resque'
gem 'resque-scheduler'
gem 'redis', "~> 3.0"

group :development, :test do
  gem 'sqlite3', '1.3.13'
  gem 'byebug',  "~> 11.0", platform: :mri
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.0.8'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'pg', '0.20.0'
end

group :development, :test do
  gem 'pry-rails'  # rails console(もしくは、rails c)でirbの代わりにpryを使われる
  gem 'pry-doc'    # methodを表示
  gem 'pry-byebug', '3.9.0' # デバッグを実施(Ruby 2.0以降で動作する)
  gem 'pry-stack_explorer' # スタックをたどれる
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'tzinfo-data'
