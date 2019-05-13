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
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|kana_first_name|string|null: false|
|kana_last_name|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_date|integer|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|password_confirmation|string|null: false|
|introduction|text|

### Association
- has_many :comments
- has_many :likes 
- has_one :address
- has_one :payment
- has_one :sale
- has_one :point
- has_many :products

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street|string|null: false|
|building|string|
|phone|string|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user, dependent: :destory

## paymentsテーブル
|Column|Type|Options|
|------|----|-------|
|card_holder|string|null: false|
|card_number|integer|null: false, unique: true|
|expiration_date|integer|null: false|
|security_code|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user, dependent: :destory

## salesテーブル
|Column|Type|Options|default|
|------|----|-------|-------|
|total_sales|integer||0|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user, dependent: :destory

## pointsテーブル
|Column|Type|Options|default|
|------|----|-------|-------|
|earn_points|integer||0|
|used_points|integer||0|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user, dependent: :destory

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|condition|string|null: false|
|payment_method_of_delivery_fee|string|null: false|
|origin_of_delivery|string|null: false|
|estimated_date_of_delivery|string|null: false|
|size|string|
|brand|references|foreign_key: true|
|category|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- has_many :comments
- has_many :likes
- belongs_to :user, dependent: :destory
- has_many :images
- belongs_to :brand

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :product, dependent: :destory

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
|tree_path|string|null: false|

### Association
- has_many :products
