class AddProductIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :product_id, :integer

    Sale.all.each do |sale|
      product = Product.where(name: sale.product_name).first
      sale.product_id = product.id
      sale.save!
    end
  end

  def down
    remove_column :sales, :product_id
  end
end
