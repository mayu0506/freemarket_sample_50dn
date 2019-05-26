class RemoveKanaLastNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :kana_last_name, :string
  end
end
