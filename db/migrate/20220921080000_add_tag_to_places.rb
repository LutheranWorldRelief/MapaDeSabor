class AddTagToPlaces < ActiveRecord::Migration[5.1]
  def change

    add_column :places, :tag, :string

    Place.update_all("tag='guia1'")
  end
end
