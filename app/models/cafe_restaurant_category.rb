class CafeRestaurantCategory < ApplicationRecord
  belongs_to :cafe_restaurant
  belongs_to :category
end
