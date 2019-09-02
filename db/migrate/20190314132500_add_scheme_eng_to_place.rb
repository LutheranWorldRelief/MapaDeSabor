class AddSchemeEngToPlace < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :scheme_eng, :text
  end
end
