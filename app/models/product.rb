class Product < ApplicationRecord
  include JpPrefecture
  jp_prefecture :origin_of_delivery
  has_many :images,dependent: :destroy, inverse_of: :product
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  belongs_to :category, optional: true
  belongs_to :user, optional: true
  accepts_nested_attributes_for :images

  validates :name,                presence: true
  validates :description,         presence: true
  validates :price,               presence: true
  validates :status,              presence: true
  validates :who_to_pay,          presence: true
  validates :origin_of_delivery,  presence: true
  validates :deliverying_date,    presence: true
  validates :user_id,             presence: true

  # 商品出品カテゴリーが出来次第 null:faleseと共に実装
  # validates :category_id          presence: true
end
