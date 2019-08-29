class CreateCourseUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :course_users do |t|
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true
      t.date :join_date
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :course_users, [:course_id, :user_id], unique: true
  end
end
