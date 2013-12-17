class SalesController < ApplicationController
  def index
    date = Date.new(2012, 9, 1)
    @sales = Sale.where("sale_date > ?", date).order(:sale_date).all
  end

  def self.price_per_unit(sale)
    "$" << sprintf('%.2f', (sale.sale_amount / sale.units_sold).to_f)
  end
end
