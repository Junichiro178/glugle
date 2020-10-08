class CafeRestaurant < ApplicationRecord
  has_many :cafe_restaurant_categories, dependent: :destroy
  has_many :categories, through: :cafe_restaurant_categories
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  validates :name, :phonetic_name, :phone_number, :description, :opening_hours, :regular_holidays, :prefecture_id, :city_ward, :block_number, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
