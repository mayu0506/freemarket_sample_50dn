class Product < ApplicationRecord
  has_many :images,dependent: :destory
  has_many :likes,dependent: :destory
end
