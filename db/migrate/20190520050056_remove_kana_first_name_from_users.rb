class RemoveKanaFirstNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :kana_first_name, :string
  end
end
