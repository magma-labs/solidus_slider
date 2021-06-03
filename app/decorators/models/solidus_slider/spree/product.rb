# frozen_string_literal: true

module SolidusSlider
  module Spree
    module Product
      def self.prepended(base)
        base.has_one :slide
        base.after_update :destroy_slide_if_deleted

        def base.destroy_slide_if_deleted
          slide.update(published: false) if slide && deleted_at
        end
      end

      ::Spree::Product.prepend(self)
    end
  end
end
