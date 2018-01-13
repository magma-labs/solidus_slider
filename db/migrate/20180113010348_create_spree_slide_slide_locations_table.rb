class CreateSpreeSlideSlideLocationsTable < SolidusSupport::Migration[4.2]
  def change
    create_table :spree_slide_slide_locations do |t|
      t.integer :slide_id
      t.integer :slide_location_id
    end

    add_index :spree_slide_slide_locations, [:slide_id, :slide_location_id], name: 'index_spree_slide_slide_locations'
  end
end
