class CreateCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :parent_id

      t.timestamps
    end

    add_column :products, :category_id, :integer
  end
end
