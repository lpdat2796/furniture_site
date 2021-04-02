class AddColumnUuidToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :uuid, :string
  end
end