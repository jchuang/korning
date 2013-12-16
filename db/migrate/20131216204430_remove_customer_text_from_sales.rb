class RemoveCustomerTextFromSales < ActiveRecord::Migration
  def up
    remove_column :sales, :customer_and_account_no
    change_column :sales, :customer_id, :integer, null: false
  end

  def down
    add_column :sales, :customer_and_account_no, :string
  end
end
