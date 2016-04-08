# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_slider'
  s.version     = '1.2.5'
  s.summary     = 'Solidus Slider extension'
  s.description = 'Adds a slider to the homepage'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Saman Mohamadi'
  s.email             = 'mohamadi.saman@gmail.com'
  s.homepage          = 'https://github.com/samanmohamadi/solidus_slider'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'solidus_core', '>= 1.1'
  s.add_dependency 'solidus_backend', '>= 1.1'

  s.add_development_dependency 'byebug'
end
