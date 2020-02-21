class AddGraphicToPlaces < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :places, :graphic_one
  	add_attachment :places, :graphic_two

  end
end
