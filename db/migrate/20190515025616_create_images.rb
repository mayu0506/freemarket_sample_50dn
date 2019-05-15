class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text       :image
      t.references :product,  null:false, Fforeign_key: true
      t.timestamps
    end
  end
end
