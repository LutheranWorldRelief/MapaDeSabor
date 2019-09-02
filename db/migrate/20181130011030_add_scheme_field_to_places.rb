class AddSchemeFieldToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :scheme, :text

  end
end
