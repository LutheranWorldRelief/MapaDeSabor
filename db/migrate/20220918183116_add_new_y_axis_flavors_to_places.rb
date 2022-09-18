class AddNewYAxisFlavorsToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :y_axis_2, :float
  end
end
