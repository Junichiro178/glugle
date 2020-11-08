<!-- <div align="center" >![glugle-logo](https://user-images.githubusercontent.com/66509126/98461877-3252f880-21f3-11eb-869d-c9607f8ffd3f.png)</div width="400px;"> -->

<div align="center" ><img src="https://user-images.githubusercontent.com/66509126/98461877-3252f880-21f3-11eb-869d-c9607f8ffd3f.png" width="200px;" /></div>



<h2 align="center">グルテンフリーレストラン専用検索アプリ <br/>【glugle(ぐるぐる)】</h2>

## 🌐 アプリケーション URL
### http://18.180.51.7/

## 💬 Usage

## 🌾 制作背景
- 小麦アレルギーの原体験
実は私は小麦を含む3つの大きなアレルギーを持っている重度のアレルギー体質です。
以前にはアナフィラキシーショックを発症し、死にかけたこともありました。
普段の食事から気を使い、外食の際には確実にアレルギー対応をしているお店を特定する必要があります。

- 日本でのアレルギー対応の遅さ
実は日本では小麦アレルギーの対応が、海外に比べ30年以上遅れていると言われています。
実際、海外のお店では絶対に「グルテンフリー」の表記があるのに対し、日本ではアレルギー成分表さえおいていない、
というお店もざらに存在する現状です。日本でアレルギー対応のお店を探すことの難しさを痛感した瞬間です。
友人と食事をする際に、一緒のお店で同じ時間を過ごすことができない。これほど悲しい体験はありません。
私も何度も、友人が「ごめんね」と言いながら食事をし、自分は水を飲むだけという経験をしました。
「このような場面を減らし、もっと食事を楽しめる時間を増やしたい」「友人との大切な時間をより楽しいものにしたい」
そのような思いから、このアプリケーションの開発を始めました。

## DB設計
## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_name|string|null: false|
|e_mail|string|null: false, unique: true|
|password|string|null: false|
|birthday|string|null: false|
### Association
- has_many :restaurants-cafes 
- has_many :likes, dependent: :destroy
- has_many :reviews, dependent: :destroy

## Reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|null: false|
|score|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|store_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :restaurant-cafe

## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|store_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :restaurant-cafe

## Restaurants-Cafesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
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
- has_many :store_categories_restaurants-cafes
- has_many :store_categories, through: :store_restaurants-cafes
- has_many :tags_restaurants-cafes
- has_many :tags, through: :tags_restaurants-cafes
- belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

## store_categories_storesテーブル
|Column|Type|Options|
|------|----|-------|
|store_id|references|null: false, foreign_key: true|
|store_category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :restaurant-cafe
- belongs_to :store_category

## store_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :store_categories_stores
- has_many :restaurants-cafes, through: :store_categories_stores

## tags_stores
|Column|Type|Options|
|------|----|-------|
|store_id|references|null: false, foreign_key: true|
|tags_id|references|null: false, foreign_key: true|
### Association
- belongs_to :restaurant-cafe
- belongs_to :tags

## tags(features)テーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
### Association
- has_many :tags_stores
- has_many :restaurants-cafes, through: :tags_stores

## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|store_id|references|null: false, foreign_key: true|
### Association
- belongs_to :restaurant-cafe

## menusテーブル
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
- belongs_to :restaurant-cafe

## menu-categories_menusテーブル
|Column|Type|Options|
|------|----|-------|
|menu_id|references|null: false, foreign_key: true|
|menu_category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :menu
- belongs_to :menu_category

## menu_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :menu-categories_menus
- has_many :menus, through: :menu-categories_menus
