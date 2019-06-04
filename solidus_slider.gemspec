# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'solidus_slider/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'solidus_slider'
  s.version     = SolidusSlider::VERSION
  s.authors     = ['Giuseppe Privitera', 'Jonathan Tapia', 'MagmaLabs']
  s.email       = 'developers@magmalabs.io'
  s.homepage    = 'https://github.com/magma-labs/solidus_slider'
  s.summary     = 'Spree Slider extension'
  s.description = 'Adds a slider to the homepage'

  # s.files = Dir['{app,config,models,db,lib}/**/*'] + %w(MIT-LICENSE Rakefile README.md)
  s.files         = `git ls-files`.split("\n")
  s.require_path  = 'lib'
  s.requirements << 'none'

  s.add_dependency 'solidus', ['>= 1.2', '< 3']
  s.add_dependency 'solidus_support'
  s.add_dependency 'jbuilder', '~> 2.6'
  s.add_dependency 'kaminari', '>= 0.17', '< 2.0'

  s.add_development_dependency 'database_cleaner', '~> 1.6'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails', '~> 3.3'
  s.add_development_dependency 'simplecov', '~> 0.14'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'growl'
  s.add_development_dependency 'sqlite3', '~> 1.3.6'
end

