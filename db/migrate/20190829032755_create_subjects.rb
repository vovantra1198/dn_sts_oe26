class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :details
      t.integer :duration_default
      t.boolean :deleted, default: false
      t.timestamps
    end
  end
end
