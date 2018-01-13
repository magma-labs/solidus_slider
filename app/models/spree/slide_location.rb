module Spree
  class SlideLocation < ActiveRecord::Base
    has_one :slide_slide_locations
    has_one :slide, through: :slide_slide_locations

    validates :name, presence: true
  end
end
