class AddEmployeeIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :employee_id, :integer

    sales = Sale.all.to_a
    sales.each do |sale|
      employee_data = sale.employee.split(' ')
      employee = Employee.where(email: employee_data[2][1..-2]).first
      sale.employee_id = employee.id
      sale.save!
    end
  end

  def down
    remove_column :sales, :employee_id
  end
end
