class AddEnglishFieldsToPlace < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :description_eng, :text
    add_column :places, :quality_flavors_eng, :text
    add_column :places, :content_right_eng, :text
    add_column :places, :harvest_eng, :text
    add_column :places, :content_left_eng, :text
  end
end
