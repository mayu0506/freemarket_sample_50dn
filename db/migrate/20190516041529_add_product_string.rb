class AddProductString < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :products do |t|
        dir.up   { t.change :who_to_pay, :integer }
        dir.up   { t.change :origin_of_delivery, :integer }
        dir.up   { t.change :deliverying_date, :integer }
        dir.down { t.change :who_to_pay, :string }
        dir.down { t.change :origin_of_delivery, :string }
        dir.down { t.change :deliverying_date, :string }
      end
    end
  end
end
