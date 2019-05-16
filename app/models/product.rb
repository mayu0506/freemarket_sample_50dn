class Product < ApplicationRecord
  has_many :images,dependent: :destroy
  has_many :likes,dependent: :destroy

 

  # セレクトボックス選択肢の管理
    enum option: {
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

    enum delivery_date: {
      '---': 0,
      '1~2日で発送': 1,
      '2~3日で発送': 2,
      '4~7日で発送': 3,
    }, _suffix: true

end
