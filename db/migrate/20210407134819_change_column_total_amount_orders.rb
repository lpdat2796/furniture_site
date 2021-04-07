class ChangeColumnTotalAmountOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :total_amount, :string
  end
end
