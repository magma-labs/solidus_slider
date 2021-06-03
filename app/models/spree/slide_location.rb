# frozen_string_literal: true

module Spree
  class SlideLocation < ApplicationRecord
    has_one :slide_slide_locations
    has_one :slide, through: :slide_slide_locations

    validates :name, presence: true
  end
end
