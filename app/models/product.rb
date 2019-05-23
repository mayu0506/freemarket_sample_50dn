class Product < ApplicationRecord
  include JpPrefecture
  jp_prefecture :origin_of_delivery
  has_many :images,dependent: :destroy, inverse_of: :product
  has_many :likes,dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :images
end
