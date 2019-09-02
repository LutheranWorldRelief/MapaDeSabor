class CreatePagesPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pages_pictures do |t|
      t.references :page
      t.string :title
      t.attachment :picture
      t.timestamps
    end
  end
end
