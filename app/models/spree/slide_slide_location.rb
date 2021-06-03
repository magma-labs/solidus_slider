# frozen_string_literal: true

module Spree
  class SlideSlideLocation < ApplicationRecord
    belongs_to :slide
    belongs_to :slide_location
  end
end
