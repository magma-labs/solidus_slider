module Spree
  class SlideSlideLocation < ActiveRecord::Base
    self.table_name = 'spree_slide_slide_locations'

    belongs_to :slide
    belongs_to :slide_location
  end
end