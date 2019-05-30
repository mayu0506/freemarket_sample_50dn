# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|contents|text|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|
|first_name|string|
|last_name|string|
|kana_first_name|string|
|kana_last_name|string|
|birth_date|data|
|email|string|null: false, unique: true|
|password|string|null: false|
|password_confirmation|string|null: false|
|uid|string|
|provider|string|

### Association
- has_many :comments
- has_many :likes ,dependent: :destory
- has_one :address,dependent: :destory
- has_one :payment, dependent: :destory
- has_one :sale,dependent: :destory
- has_one :point, dependent: :destory
- has_many :products, dependent: :destory

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|integer|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|street|string|null: false|
|building|string|
|phone|integer|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user, dependent: :destroy

## paymentsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|integer||
|card_id|integer||
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user, dependent: :destroy

## salesテーブル
|Column|Type|Options|default|
|------|----|-------|-------|
|total_sales|integer||0|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## pointsテーブル
|Column|Type|Options|default|
|------|----|-------|-------|
|earn_points|integer||0|
|used_points|integer||0|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## productsテーブル
|Column|Type|Options|Default|
|------|----|-------|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|condition|string|null: false|
|status|integer|null: false|selling|
|payment_method_of_delivery_fee|integer|null: false|
|origin_of_delivery|integer|null: false|
|estimated_date_of_delivery|integer|null: false|
|size|string|
|brand|references|foreign_key: true|
|category|references|null: false, foreign_key: true|
|user_id|references|null: false, add_foreign_key :true|
|buyer_id|integer|

### Association
- has_many :comments
- has_many :likes
- belongs_to :user
- has_many :images,dependent: :destory
- belongs_to :brand
- belongs_to :category

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :product

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|add_index|

### Association
- has_many :products
- has_ancestry

## tradesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null:false,foreign_keys:true|
|product|references|null:false,foreign_keys:true|
|date_of_confirmation|date|null:true|

### Association
- belongs_to :product
- belongs_to :user
