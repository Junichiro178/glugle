class RestaurantImage < ApplicationRecord
  belongs_to :cafe_restaurant
  mount_uploader :image, RestaurantImageUploader
end
