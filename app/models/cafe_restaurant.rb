class CafeRestaurant < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  validates :name, :phonetic_name, :phone_number, :description, :opening_hours, :regular_holidays, :prefecture, :city_ward, :block_number, presence: true
end
