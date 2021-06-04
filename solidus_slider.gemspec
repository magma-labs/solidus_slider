# frozen_string_literal: true

require_relative 'lib/solidus_slider/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_slider'
  s.version     = SolidusSlider::VERSION
  s.authors     = ['Giuseppe Privitera', 'Jonathan Tapia', 'MagmaLabs']
  s.email       = 'developers@magmalabs.io'
  s.homepage    = 'https://github.com/magma-labs/solidus_slider'
  s.summary     = 'Spree Slider extension'
  s.description = 'Adds a slider to the homepage'
  s.homepage = 'https://github.com/jtapia/solidus_slider'
  s.license = 'BSD-3-Clause'

  if s.respond_to?(:metadata)
    s.metadata['homepage_uri'] = s.homepage if s.homepage
    s.metadata['source_code_uri'] = s.homepage if s.homepage
  end

  s.required_ruby_version = Gem::Requirement.new('>= 2.5')

  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  s.files = files.grep_v(%r{^(test|spec|features)/})
  s.test_files = files.grep(%r{^(test|spec|features)/})
  s.bindir = 'exe'
  s.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'solidus_core', ['>= 2.5', '< 4']
  s.add_dependency 'solidus_backend', ['>= 2.5', '< 4']
  s.add_dependency 'solidus_support'
  s.add_dependency 'deface', '~> 1.0'

  s.add_development_dependency 'solidus_dev_support', '~> 2.3'
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'growl'
end
