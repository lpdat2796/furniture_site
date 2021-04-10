class AddColumnIsSelectedToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :is_selected, :boolean, default: false
  end
end
