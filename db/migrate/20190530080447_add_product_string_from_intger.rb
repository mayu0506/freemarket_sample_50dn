class AddProductStringFromIntger < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :products do |t|
        dir.up   { t.change :who_to_pay, :string }
        dir.up   { t.change :origin_of_delivery, :string }
        dir.up   { t.change :deliverying_date, :string }
        dir.down { t.change :who_to_pay, :integer }
        dir.down { t.change :origin_of_delivery, :integer }
        dir.down { t.change :deliverying_date, :integer }
      end
    end
  end
end
