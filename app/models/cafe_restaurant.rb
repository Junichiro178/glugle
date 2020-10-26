class CafeRestaurant < ApplicationRecord
  #カテゴリー機能
  has_many :cafe_restaurant_categories, dependent: :destroy
  has_many :categories, through: :cafe_restaurant_categories

  #画像の投稿
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  #オーナーIDの登録
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  validates :images, :name, :phonetic_name, :phone_number, :description, :opening_hours, :regular_holidays, :prefecture_id, :city_ward, :block_number, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  def self.search(search)
    return CafeRestaurant.all unless search
    CafeRestaurant.where('name LIKE(?)', "%#{search}%")
  end

end
