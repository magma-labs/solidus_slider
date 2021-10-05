ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)

require 'solidus_frontend'
require 'solidus_backend'
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |file| require file }

require 'spree/testing_support/url_helpers'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/preferences'
require 'spree/testing_support/factories'
require 'spree/api/testing_support/helpers'
require 'spree/api/testing_support/setup'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
if branch == 'master' || branch >= 'v2.5'
  ENV['FACTORY'] = 'FactoryBot'
else
  ENV['FACTORY'] = 'FactoryGirl'
end

# Requires factories defined in lib/solidus_slider/factories.rb
load "#{File.dirname(__FILE__)}/../lib/solidus_slider/factories.rb"

RSpec.configure do |config|
  eval("config.include #{ENV.fetch('FACTORY')}::Syntax::Methods")

  config.infer_spec_type_from_file_location!
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true

  config.include Spree::Api::TestingSupport::Helpers, type: :controller
  config.extend  Spree::Api::TestingSupport::Setup, type: :controller
  config.include Spree::TestingSupport::ControllerRequests, type: :controller
  config.include Spree::TestingSupport::UrlHelpers
  config.extend Spree::TestingSupport::AuthorizationHelpers::Request, type: :request
  config.include Spree::TestingSupport::Preferences, type: :controller
  config.include Spree::TestingSupport::Preferences, type: :model
end
