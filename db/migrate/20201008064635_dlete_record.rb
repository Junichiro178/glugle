class DleteRecord < ActiveRecord::Migration[5.2]
  def change
    drop_table :restaurant_images
  end
end
