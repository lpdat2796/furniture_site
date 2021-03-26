class AddColumnDimensionsProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :dimension_x, :integer
    add_column :products, :dimension_y, :integer
    add_column :products, :dimension_z, :integer
  end
end