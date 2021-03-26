class DropMasterData < ActiveRecord::Migration[5.1]
  def change
    drop_table :master_data
  end
end