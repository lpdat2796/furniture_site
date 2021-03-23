class CreateProductImage < ActiveRecord::Migration[5.1]
  def change
    create_table :product_images do |t|
      t.references :product, index: true
      t.string :file_data

      t.timestamps
    end
  end
end
