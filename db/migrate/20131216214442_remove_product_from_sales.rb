class RemoveProductFromSales < ActiveRecord::Migration
  def up
    remove_column :sales, :product_name
    change_column :sales, :product_id, :integer, null: false
  end

  def down
    add_column :sales, :product_name, :string
  end
end
