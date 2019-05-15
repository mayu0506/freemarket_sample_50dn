class RemoveBirthDateFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :birth_date, :integer, null: false
  end
end
