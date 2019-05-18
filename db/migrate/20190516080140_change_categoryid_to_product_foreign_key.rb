class ChangeCategoryidToProductForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :products, :categories, column: :category_id
  end
end
