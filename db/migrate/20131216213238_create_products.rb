class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name, null: false

      t.timestamps
    end

    Sale.all.each do |sale|
      Product.find_or_create_by(name: sale.product_name)
    end
  end

  def down
    drop_table :products
  end
end
