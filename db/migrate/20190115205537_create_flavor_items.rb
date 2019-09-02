class CreateFlavorItems < ActiveRecord::Migration[5.1]
  def change
    create_table :flavor_items do |t|
      t.integer :position_x
      t.integer :position_y
      t.references :flavor, foreign_key: true

      t.timestamps
    end
  end
end
