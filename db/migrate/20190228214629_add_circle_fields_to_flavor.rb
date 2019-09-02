class AddCircleFieldsToFlavor < ActiveRecord::Migration[5.1]
  def change
    add_column :flavors, :position_x, :string
    add_column :flavors, :position_y, :string
    add_column :flavors, :position_z, :string
    add_column :flavors, :order, :integer
  end
end
