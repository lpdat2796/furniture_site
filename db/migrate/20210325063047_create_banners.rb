class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.string :name
      t.string :image
      t.boolean :is_public, default: false
      t.string :url
      t.integer :sort_order, default: 0
    end
  end
end