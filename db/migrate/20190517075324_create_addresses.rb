class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string     :postcode, :limit => 8, null:false
      t.integer     :prefecture_code, null:false
      t.string      :city, null:false
      t.string      :street, null:false
      t.string      :building, null:true
      t.string     :phone, :limit => 11, null:true
      t.references  :user, null:false, foreign_key:true
      t.timestamps
    end
  end
end
