class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :content
      t.integer :location, default: 0
      t.date :start_date
      t.integer :status, default: 0
      t.boolean :deleted, default: false
      t.timestamps
    end
  end
end
