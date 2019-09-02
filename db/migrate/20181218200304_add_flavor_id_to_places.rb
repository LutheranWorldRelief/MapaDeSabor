class AddFlavorIdToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :flavor_id, :integer
  end
end
