class AddMultipleColumnsToProducts < ActiveRecord::Migration[5.1]
  def change
    drop_table :colors
    drop_table :materials
    drop_table :color_products
    drop_table :material_products
    add_column :products, :color, :string
    add_column :products, :material, :string
  end
end
