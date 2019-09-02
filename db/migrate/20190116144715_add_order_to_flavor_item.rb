class AddOrderToFlavorItem < ActiveRecord::Migration[5.1]
  def change
    add_column :flavor_items, :order, :integer
  end
end
