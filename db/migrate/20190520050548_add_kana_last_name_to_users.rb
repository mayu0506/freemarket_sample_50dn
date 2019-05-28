class AddKanaLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :kana_last_name, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :birth_date, :date
  end
end
