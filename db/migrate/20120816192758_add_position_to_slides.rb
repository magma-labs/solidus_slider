# frozen_string_literal: true

class AddPositionToSlides < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_slides, :position, :integer, null: false, default: 0
  end
end
