class CreateProducts < ActiveRecord::Migration[4.2][5.2][5.2][4.2][5.2]
  def change
    create_table :products do |t|
      t.string :name,                                    null: false
      t.text :description,                               null: false
      t.integer :price,                                  null: false 
      t.string :condition,                               null: false
      t.string :status,                                  null: false, default: 'selling'
      t.string :who_to_pay,                              null: false
      t.string :origin_of_delivery,                      null: false
      t.string :deliverying_date,                        null: false
      t.string :size                                
      t.integer :buyer_id
      t.references :user,                                null: false, foreign_key: true
      t.timestamps
    end
  end
end

