class AddColumnAmountToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :amount, :integer, default: 0
  end
end