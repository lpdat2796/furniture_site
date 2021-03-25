class AddColumnIsPublicCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :is_public, :boolean, default: false
    remove_column :products, :category_id
  end
end