class UpdateDataTypes < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :price, :decimal, precision: 9, scale: 2
    change_column :products, :description, :text
    add_column :products, :quantity, :integer
  end
end
