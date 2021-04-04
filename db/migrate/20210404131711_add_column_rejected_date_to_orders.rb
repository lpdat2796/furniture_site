class AddColumnRejectedDateToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :rejected_at, :date
    add_column :orders, :whodunit, :integer
  end
end