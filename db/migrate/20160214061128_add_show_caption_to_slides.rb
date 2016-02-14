class AddShowCaptionToSlides < ActiveRecord::Migration
  def change
    add_column :spree_slides, :show_caption, :boolean
  end
end
