class RemoveColumnUrlBanners < ActiveRecord::Migration[5.1]
  def change
    remove_column :banners, :url
  end
end
