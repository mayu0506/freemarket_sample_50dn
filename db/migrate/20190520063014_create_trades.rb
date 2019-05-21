class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.references  :user, foreign_keys:true
      t.references  :product, foreign_keys:true
      t.date        :date_of_confirmation, null:true
      t.timestamps
    end
  end
end
