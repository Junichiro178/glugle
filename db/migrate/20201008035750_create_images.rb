class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image
      t.references :cafe_restaurant
      t.timestamps
    end
  end
end
