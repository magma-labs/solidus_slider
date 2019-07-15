source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch
gem 'solidus_i18n', github: 'solidusio-contrib/solidus_i18n'

if branch == 'master' || branch >= 'v2.3'
  gem 'rails', '~> 5.1.0'
  gem 'rails-controller-testing', group: :test
elsif branch >= 'v2.0'
  gem 'rails', '~> 5.0.0'
  gem 'rails-controller-testing', group: :test
else
  gem 'rails', '~> 4.2.0'
  gem 'rails_test_params_backport', group: :test
end

if ENV['DB'] == 'mysql'
  gem 'mysql2', '~> 0.4.10'
else
  gem 'pg', '~> 0.21'
end

group :development, :test do
  gem 'factory_bot', (branch < 'v2.5' ? '4.10.0' : '> 4.10.0')
  gem 'pry-rails'
  gem 'i18n-tasks', '~> 0.9' if branch == 'master'
end

gemspec
