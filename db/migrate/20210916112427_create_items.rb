class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
    t.integer :genre_id
    t.string :name
    t.text :introduction
    t.string :image_id
    t.integer :price
    t.boolean :is_active
      t.timestamps
    end
  end
end
