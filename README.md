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

##commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

##likesテーブル
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
|introduction|text|null: false|
|product|references|null: false, foreign_key: true|

###Association
- has_many :comments
- has_one :address
- has_one :payment
- has_one :sale
- has_one :point
- has_many :products

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|integer|null: false|
|prefecture||null: false|
|city|string|null: false|
|address1|string|null: false|
|address2|string|
|phone|integer|
|user|references|null: false, foreign_key: true|

###Association
- belongs_to :user, dependent: :destory

##paymentsテーブル
|Column|Type|Options|
|------|----|-------|
|card_name|string|
|card_number|integer|unique: true|
|expiration_date|integer|
|security_code|integer|
|user|references|null: false, foreign_key: true|

###Association
- belongs_to :user, dependent: :destory

##salesテーブル
|Column|Type|Options|default|
|------|----|-------|-------|
|total_sales|integer|0|
|user|references|null: false, foreign_key: true|

###Association
- belongs_to :user, dependent: :destory

##pointsテーブル
|Column|Type|Options|default|
|------|----|-------|-------|
|earn_points|integer|0|
|used_points|integer|0|
|user|references|null: false, foreign_key: true|

###Association
- belongs_to :user, dependent: :destory

##productsテーブル
|Column|Type|Options|default|
|------|----|-------|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|0|
|condition|string|null: false|
|payment_method_of_delivery_fee|string|null: false|
|origin_of_delivery|string|null: false|
|estimated_date_of_delivery|string|null: false|
|image|references|null: false, foreign_key: true|
|size|references|foreign_key: true|
|brand|references|foreign_key: true|
|category|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

###Association
- has_many :comments
- has_many :likes
- belongs_to :user
- has_many :images
- has_one :size
- has_one :brand
- has_one :large_category

##imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|product|references|null: false, foreign_key: true|

###Association
- belongs_to :product, dependent: :destory

##sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|product|references|null: false, foreign_key: true|

###Association
- belongs_to :product, dependent: :destory

##brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product|references|null: false, foreign_key: true|

###Association
- belongs_to :product, dependent: :destory

##large_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product|references|null: false, foreign_key: true|
|medium_category|references|null: false, foreign_key: true|

###Association
- belongs_to :product, dependent: :destory
- belongs_to :medium_category

##medium_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|large_category|references|null: false, foreign_key: true|
|small_category|references|null: false, foreign_key: true|

###Association
- belongs_to :large_category, dependent: :destory
- belongs_to :small_category

##small_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|medium_category|references|null: false, foreign_key: true|

###Association
- belongs_to :medium_category, dependent: :destory
