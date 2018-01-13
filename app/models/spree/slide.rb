module Spree
  class Slide < ActiveRecord::Base
    belongs_to :product, touch: true

    self.table_name = 'spree_slides'

    has_many :slide_slide_locations
    has_many :slide_locations, through: :slide_slide_locations

    has_attached_file :image,
                      url: '/spree/slides/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/slides/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

    validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

    scope :published, -> { where(published: true).order('position ASC') }
    scope :location, -> (location){ joins(:slide_locations).where('spree_slide_locations.name = ?', location) }

    def initialize(attrs = nil)
      attrs ||= { published: true }
      super
    end

    def show_caption?
      show_caption
    end

    def slide_caption
      name.blank? && product.present? ? product.name : name
    end

    def slide_name
      name.blank? && product.present? ? product.name : name
    end

    def slide_link
      link_url.blank? && product.present? ? product : link_url
    end

    def slide_image
      !image.file? && product.present? && product.images.any? ? product.images.first.attachment : image
    end

    def slide_location_ids
      slide_locations.pluck(:id)
    end
  end
end
