class CreateRestaurantCafes < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_cafes do |t|
      t.string :name, null: false
      t.string :phonetic_name, null: false
      t.string :phone_number, null: false, unique: true
      t.string :description, null: false
      t.string :opening_hours, null: false
      t.string :regular_holidays, null: false
      t.integer :prefecture, null: false
      t.string :city_ward, null: false
      t.string :block_number, null: false
      t.string :building_name
      t.references :owner, null: false
      t.timestamps
    end
  end
end