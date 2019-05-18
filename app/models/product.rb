class Product < ApplicationRecord
  has_many :images,dependent: :destroy
  has_many :likes,dependent: :destroy
  belongs_to :category
end
