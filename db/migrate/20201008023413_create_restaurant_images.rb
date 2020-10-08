class CreateRestaurantImages < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_images do |t|
      t.references :cafe_restaurant
      t.string :image
      t.timestamps
    end
  end
end
