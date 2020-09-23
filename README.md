# README

# DB design
## Users table
|Column|Type|Options|
|------|----|-------|
|user_name|string|null: false|
|e_mail|string|null: false, unique: true|
|password|string|null: false|
|birthday|string|null: false|
### Association
- has_many :stores 
- has_many :likes, dependent: :destroy
- has_many :reviews, dependent: :destroy

## Reviews table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|null: false|
|score|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|store_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :store

## Likes table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|store_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :store

## Stores table
|Column|Type|Options|
|------|----|-------|
|store_name|string|null: false|
|phonetic_store_name|string|null: false|
|phone_number|string|null: false, unique: true|
|description|text|null: false|
|opening_hours|string|null: false|
|regular holiday|string|null: false|
|postal_code|integer|null: false|
|prefecture_id(active_hash)|integer|null: false|
|city_ward|string|null: false|
|block_number|string|null: false|
|building_name|string||
|owner_id|references|null: false|
### Association
- has_many :reviews
- has_many :likes
- has_many :images
- has_many :menus
- has_many :store_categories_stores
- has_many :store_categories, through: :store_categories_stores
- has_many :tags_stores
- has_many :tags, through: :tags_stores
- belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

## store_categories_stores table
|Column|Type|Options|
|------|----|-------|
|store_id|references|null: false, foreign_key: true|
|store_category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :store
- belongs_to :store_category

## store_categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :store_categories_stores
- has_many :stores, through: :store_categories_stores

## tags_stores
|Column|Type|Options|
|------|----|-------|
|store_id|references|null: false, foreign_key: true|
|tags_id|references|null: false, foreign_key: true|
### Association
- belongs_to :store
- belongs_to :tags

## tags(features) table
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
### Association
- has_many :tags_stores
- has_many :stores, through: :tags_stores

## Images table
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|store_id|references|null: false, foreign_key: true|
### Association
- belongs_to :store

## menus table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|image|text||
|description|text|null: false|
|store_id|references|null: false, foreign_key: true|
### Association
- has_many :menu-categories_menus
- has_many :menu-categories, through: :menu-categories_menus
- belongs_to :store

## menu-categories_menus table
|Column|Type|Options|
|------|----|-------|
|menu_id|references|null: false, foreign_key: true|
|menu_category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :menu
- belongs_to :menu_category

## menu_categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :menu-categories_menus
- has_many :menus, through: :menu-categories_menus
