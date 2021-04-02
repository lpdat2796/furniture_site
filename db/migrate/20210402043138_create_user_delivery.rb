class CreateUserDelivery < ActiveRecord::Migration[5.1]
  def change
    create_table :order_deliveries do |t|
      t.references :order, index: true
      t.string :address
      t.string :full_name
      t.string :phone
    end
  end
end
