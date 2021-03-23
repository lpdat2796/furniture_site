class CreateMasterData < ActiveRecord::Migration[5.1]
  def change
    create_table :master_data do |t|
      t.references :product
      t.integer :dimension_x
      t.integer :dimension_y
      t.integer :dimension_z
      t.string :material
      t.string :color
      t.string :style

      t.timestamps
    end
  end
end
