class CreateMaterialProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :material_products do |t|
      t.references :material
      t.references :product
      t.timestamps
    end
  end
end
