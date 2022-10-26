class AddNewHeightLengthTagToFlavors < ActiveRecord::Migration[5.1]
  def change
    add_column :flavors, :height, :string
    add_column :flavors, :width, :string
    add_column :flavors, :tag, :string

    Flavor.update_all("height=position_z, width=position_z, tag='guia1'")
  end
end
