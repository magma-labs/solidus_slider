class CreateSliderLocation < ActiveRecord::Migration[4.2]
  def change
    create_table :spree_slide_locations do |t|
      t.string :name
      t.timestamps
    end
  end
end