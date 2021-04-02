class AddColumnAmountToOrderDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :order_details, :amount, :integer, default: 1
  end
end
