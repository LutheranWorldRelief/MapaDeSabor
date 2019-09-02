class AddTextFieldsToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :quality_flavors, :text
    add_column :places, :harvest, :text
  end
end
