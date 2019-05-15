class RemoveBirthMonthFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :birth_month, :integer, null: false
  end
end
