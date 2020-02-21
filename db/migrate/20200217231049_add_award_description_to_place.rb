class AddAwardDescriptionToPlace < ActiveRecord::Migration[5.1]
  def change
  	add_column :places, :award_desc_es, :text
  	add_column :places, :award_desc_en, :text
  end
end
