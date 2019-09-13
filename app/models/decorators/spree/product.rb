# frozen_string_literal: true

module Decorators
  module Spree
    module Product
      extend ActiveSupport::Concern

      included do
        has_one :slide, dependent: :destroy
        after_update :destroy_slide_if_deleted

        def destroy_slide_if_deleted
          slide.update_attributes(published: false) if slide && deleted_at
        end
      end
    end
  end
end

Spree::Product.include(Decorators::Spree::Product)
