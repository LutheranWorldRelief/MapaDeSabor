class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :objective
      t.text :general
      t.text :description
      t.string :youtube_url
      t.timestamps
    end
  end
end
