# encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'solidus_slider/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'solidus_slider'
  s.version     = SolidusSlider::VERSION
  s.authors     = ['Giuseppe Privitera', 'Jonathan Tapia']
  s.email       = 'jonathan.tapia@magmalabs.io'
  s.homepage    = 'https://github.com/jtapia/solidus_slider'
  s.summary     = 'Spree Slider extension'
  s.description = 'Adds a slider to the homepage'

  # s.files = Dir['{app,config,models,db,lib}/**/*'] + %w(MIT-LICENSE Rakefile README.md)
  s.files         = `git ls-files`.split("\n")
  s.require_path  = 'lib'
  s.requirements << 'none'

  solidus_version = ['>= 1.0', '< 3']
  s.add_dependency 'solidus_core', solidus_version
  s.add_dependency 'solidus_backend', solidus_version
  s.add_dependency 'solidus_api', solidus_version
  s.add_dependency 'solidus_support'
  s.add_dependency 'jbuilder', '~> 2.6'
  s.add_dependency 'kaminari', '>= 0.17', '< 2.0'

  s.add_development_dependency 'byebug'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'growl'
end

