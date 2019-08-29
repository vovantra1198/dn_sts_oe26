class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_digest
      t.string :gradution
      t.string :university
      t.string :address
      t.integer :sex, default: 1
      t.integer :role, default: 0
      t.boolean :joined, default: false
      t.boolean :activated, default: false

      t.timestamps
    end
  end
end
