class AddFieldsToFlavor < ActiveRecord::Migration[5.1]
  def change
    add_column :flavors, :flavor_type, :string
    add_column :flavors, :color, :string
  end
end
