class Address < ApplicationRecord
  belongs_to :user, optional: true
  include JpPrefecture
  jp_prefecture :prefecture_code
  
    validates :postcode, presence:true
    validates :prefecture_code, presence:true
    validates :city, presence:true
    validates :street, presence:true
end
