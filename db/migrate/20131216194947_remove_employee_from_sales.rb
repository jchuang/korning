class RemoveEmployeeFromSales < ActiveRecord::Migration
  def up
    remove_column :sales, :employee
    change_column :sales, :employee_id, :integer, null: false
  end

  def down
    add_column :sales, :employee, :string
  end
end
