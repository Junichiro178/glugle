class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :image, null: false
      t.string :description, null: false
      t.references :cafe_restaurant
      t.timestamps
    end
  end
end
