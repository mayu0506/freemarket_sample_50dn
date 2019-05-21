class AddKanaFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :kana_first_name, :string
  end
end
