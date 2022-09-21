# frozen_string_literal: true

require_relative 'lib/solidus_slider/version'

Gem::Specification.new do |s|
  s.name = 'solidus_slider'
  s.version = SolidusSlider::VERSION
  s.authors = ['Giuseppe Privitera', 'Jonathan Tapia', 'MagmaLabs']
  s.email = 'developers@magmalabs.io'

  s.summary = 'Solidus Slider extension'
  s.description = 'Adds a slider to the homepage'
  s.homepage = 'https://github.com/magma-labs/solidus_slider'
  s.license = 'BSD-3-Clause'

  if s.respond_to?(:metadata)
    s.metadata['homepage_uri'] = s.homepage if s.homepage
    s.metadata['source_code_uri'] = s.homepage if s.homepage
    s.metadata['rubygems_mfa_required'] = 'true'
  end

  s.required_ruby_version = Gem::Requirement.new('>= 2.5')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  s.files = files.grep_v(%r{^(test|spec|features)/})
  s.test_files = files.grep(%r{^(test|spec|features)/})
  s.bindir = "exe"
  s.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  solidus_version = ['>= 2.5', '< 4']

  s.add_dependency 'solidus_core', solidus_version
  s.add_dependency 'solidus_backend', solidus_version
  s.add_dependency 'solidus_api', solidus_version
  s.add_dependency 'solidus_support', ['>= 0.8.1', '< 1']
  s.add_dependency 'deface', '~> 1.0'

  s.add_development_dependency 'solidus_dev_support', '~> 2.3'
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'growl'
end
