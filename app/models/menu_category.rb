class MenuCategory < ApplicationRecord
  has_many :menu_menu_categories, dependent: :destroy
  has_many :menus, through: :menu_menu_categories
end
