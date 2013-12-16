class AddCustomerIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :customer_id, :integer

    Sale.all.each do |sale|
      customer_name = sale.customer_and_account_no.split[0]
      customer = Customer.where(name: customer_name).first
      sale.customer_id = customer.id
      sale.save!
    end
  end

  def down
    remove_column :sales, :customer_id
  end
end
