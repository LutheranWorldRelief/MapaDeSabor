class AddFieldsToPage < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :objective_eng, :text
    add_column :pages, :general_eng, :text
  end
end
