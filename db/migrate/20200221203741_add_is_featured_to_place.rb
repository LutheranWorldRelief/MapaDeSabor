class AddIsFeaturedToPlace < ActiveRecord::Migration[5.1]
  def change
  	add_column :places, :is_featured, :boolean, default: false
  end
end
