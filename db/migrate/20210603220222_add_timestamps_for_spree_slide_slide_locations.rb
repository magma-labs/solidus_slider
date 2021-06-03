# frozen_string_literal: true

class AddTimestampsForSpreeSlideSlideLocations < SolidusSupport::Migration[4.2]
  def change
    change_table :spree_slide_slide_locations, &:timestamps
  end
end
