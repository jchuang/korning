class CreateCustomers < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string :name, null: false
      t.string :account_number, null: false
      t.string :website

      t.timestamps
    end

    Sale.all.each do |sale|
      customer_raw = sale.customer_and_account_no.split
      name = customer_raw[0]
      account_number = customer_raw[1].gsub(/\(/, '').gsub(/\)/, '')
      Customer.find_or_create_by(name: name, account_number: account_number, website: nil)
    end
  end

  def down
    drop_table :customers
  end
end
