class AddSupplier < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :supplier_id, :string
  end
end
