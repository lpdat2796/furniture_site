class CreateTableOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, index: true, unique: true
      t.string :status
    end
  end
end
