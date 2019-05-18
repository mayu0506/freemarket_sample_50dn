class Address < ApplicationRecord
  belongs_to :user
  include JpPrefecture
  jp_prefecture :prefecture_code
  
    validates :postcode, presence:true
    validates :prefecture, presence:true
    validates :city, presence:true
    validates :street, presence:true
end
