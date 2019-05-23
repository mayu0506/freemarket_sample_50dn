class Product < ApplicationRecord
  has_many :images,dependent: :destroy
  has_many :likes,dependent: :destroy
  belongs_to :category
  belongs_to :user
  


  # セレクトボックス選択肢の管理
    enum condition: {
      '---': 0,
      '新品、未使用': 1,
      '未使用に近い': 2,
      '目立った傷や汚れなし': 3,
      'やや汚れや傷あり': 4,
      '傷や汚れあり': 5,
      '全体的に状態が悪い': 6
    }, _suffix: true

    enum who_to_pay: {
      '---': 0,
      '送料込み（出品者負担）': 1,
      '着払い（購入者負担）': 2
    }, _suffix: true

    enum deliverying_date: {
      '---': 0,
      '1~2日で発送': 1,
      '2~3日で発送': 2,
      '4~7日で発送': 3,
    }, _suffix: true


    enum origin_of_delivery: {
      '北海道': 1,'青森県': 2,'岩手県': 3,'宮城県': 4,'秋田県': 5,'山形県': 6,'福島県': 7,
      '茨城県': 8,'栃木県': 9,
    }, _suffix: true

end
