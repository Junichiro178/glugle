class RenamePrefectureColumnToCafeRestaurants < ActiveRecord::Migration[5.2]
  def change
    rename_column :cafe_restaurants, :prefecture, :prefecture_id
  end
end
