class AddFieldsToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :x_axis, :float
    add_column :places, :y_axis, :float
    add_column :places, :fermentation_type, :integer
  end
end
