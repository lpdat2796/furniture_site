class AddColumnRejectCommentToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :reject_comment, :string
    add_column :orders, :expected_shipment_date, :date
    add_column :orders, :shipment_date, :date
  end
end