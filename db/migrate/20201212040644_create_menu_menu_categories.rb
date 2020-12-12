class CreateMenuMenuCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_menu_categories do |t|
      t.references :menu, null: false
      t.references :menu_category, null: false
      t.timestamps
    end
  end
end
