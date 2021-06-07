# frozen_string_literal: true

module SolidusSlider
  module Spree
    module ProductDecorator
      def self.prepended(base)
        base.has_one :slide, class_name: 'Spree::Slide'
        base.after_update :destroy_slide_if_deleted

        private

        def destroy_slide_if_deleted
          slide.update(published: false) if slide && deleted_at
        end
      end

      ::Spree::Product.prepend(self)
    end
  end
end
