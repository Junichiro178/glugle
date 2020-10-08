class Image < ApplicationRecord
  belongs_to :cafe_restaurant
  mount_uploader :image, ImageUploader
end
