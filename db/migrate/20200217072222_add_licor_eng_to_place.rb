class AddLicorEngToPlace < ActiveRecord::Migration[5.1]
  def change
  	add_column :places, :liquor_eng, :string
  	add_column :places, :chocolate_eng, :string
  end
end
