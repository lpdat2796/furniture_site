class RenameColumnCoverImageOfProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :cover_image, :card_image
  end
end
