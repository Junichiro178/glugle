class Category < ApplicationRecord
  has_many :cafe_restaurant_categories, dependent: :destroy
  has_many :cafe_restaurants, through: :cafe_restaurant_categories
end
