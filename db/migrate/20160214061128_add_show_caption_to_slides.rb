# frozen_string_literal: true

class AddShowCaptionToSlides < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_slides, :show_caption, :boolean
  end
end
