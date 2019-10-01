class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.date :birthday
      t.string :company
      t.string :gradution
      t.string :university
      t.string :address
      t.integer :role, default: 0
      t.integer :gender, default: 0
      t.boolean :joined, default: false
      t.boolean :activated, default: false
      t.boolean :deleted, default: false
      t.timestamps
    end
  end
end
