class CreateEmployees < ActiveRecord::Migration
  def up
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false

      t.timestamps
    end

    sales = Sale.all.to_a
    sales.each do |sale|
      employee_data = sale.employee.split(' ')
      Employee.find_or_create_by(first_name: employee_data[0], last_name:
        employee_data[1], email: employee_data[2])
    end
  end

  def down
    drop_table :employees
  end
end
