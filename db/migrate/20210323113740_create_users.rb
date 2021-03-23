class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, index: true, unique: true
      t.string :password
      t.string :full_name
      t.string :address
      t.string :phone
      t.string :age
      t.integer :role

      t.timestamps
    end
  end
end