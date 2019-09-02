class AddOrderToFlavor < ActiveRecord::Migration[5.1]
  def change
    add_column :flavors, :is_visible, :boolean, default: true
  end
end
