class AdddColumnTotalAmountToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :total_amount, :integer
  end
end
