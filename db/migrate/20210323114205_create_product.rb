class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :is_public
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
