class Menu < ApplicationRecord
  belongs_to :cafe_restaurant
  has_many :menu_menu_categories, dependent: :destroy
  has_many :menu_categories, through: :menu_menu_categories
  validates :name, :price, :description, :image, presence: true
end
