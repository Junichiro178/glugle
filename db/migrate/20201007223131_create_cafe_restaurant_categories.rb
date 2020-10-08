class CreateCafeRestaurantCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :cafe_restaurant_categories do |t|
      t.references :cafe_restaurant, null: false
      t.references :category, null: false
      t.timestamps
    end
  end
end
