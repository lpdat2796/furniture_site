class CreateColorProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :color_products do |t|
      t.references :color
      t.references :product
      t.timestamps
    end
  end
end
