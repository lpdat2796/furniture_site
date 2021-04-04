class ChangeColumnProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :price, :string
    change_column :products, :amount, :bigint
  end
end
