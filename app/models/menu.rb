class Menu < ApplicationRecord
  belongs_to :cafe_restaurant
  has_many :menu_menu_categories, dependent: :destroy
  has_many :menu_categories, through: :menu_menu_categories
  validates :menu_categories, :name, :price, :description, :image, presence: true
  mount_uploader :image, ImageUploader
end
