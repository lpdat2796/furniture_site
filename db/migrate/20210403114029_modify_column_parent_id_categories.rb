class ModifyColumnParentIdCategories < ActiveRecord::Migration[5.1]
  def change
    change_column :categories, :parent_id, :string, default: '0'
  end
end