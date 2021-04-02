class CreateTableOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.references :order, index: true, unique: true
      t.references :product, index: true, unique: true
    end
  end
end