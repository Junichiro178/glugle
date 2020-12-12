class Menu < ApplicationRecord
  belongs_to :cafe_restaurant
  has_many :menu_menu_categories
  validates :name, :price, :description, :image, presence: true
end
