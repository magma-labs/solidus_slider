# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'
require 'solidus_slider'

module SolidusSlider
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_slider'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    config.to_prepare do
      ::Spree::Backend::Config.configure do |config|
        config.menu_items << config.class::MenuItem.new(
          [:slides],
          'photo',
          label: 'slides',
          condition: -> { can?(:manage, ::Spree::Slide) }
        )

        config.menu_items << config.class::MenuItem.new(
          [:slide_locations],
          'wrench',
          label: 'slide_locations',
          condition: -> { can?(:manage, ::Spree::SlideLocation) }
        )
      end
    end
  end
end
