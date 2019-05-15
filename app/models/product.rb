class Product < ApplicationRecord
  t.string    :name,        null:false
  t.text      :description, null:false
  t.integer   :price ,      null:false
  t.string    :condition    null:false
  t.integer   :status,      null:false, default: 'selling'
  t.integer   :payment_method_of_delivery_fee,  null:false
  t.integer   :origin_of_delivery,              null:false
  t.integer   :estimated_date_of_delivery,      null: false
  t.string    :size
end
