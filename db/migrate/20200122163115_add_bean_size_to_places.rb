class AddBeanSizeToPlaces < ActiveRecord::Migration[5.1]
  def change
  	add_column :places, :bean_size, :string, default: ''
  	add_column :places, :well_fermented, :string, default: ''
  	add_column :places, :semi_fermented, :string, default: ''
  	add_column :places, :defects, :string, default: ''
  	add_column :places, :toast_conditions, :string, default: ''
  	add_column :places, :licor, :string, default: ''
  	add_column :places, :chocolate, :string, default: ''
  end
end
