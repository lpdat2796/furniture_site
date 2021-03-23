class CreateCategoryProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :category_products do |t|
      t.references :category
      t.references :product

      t.timestamps
    end
  end
end
