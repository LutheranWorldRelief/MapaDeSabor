class AddFeaturedToPlace < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :featured, :string
  end
end
