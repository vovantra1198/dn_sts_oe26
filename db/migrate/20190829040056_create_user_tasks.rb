class CreateUserTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tasks do |t|
      t.references :user, foreign_key: true
      t.references :course_subject_task, foreign_key: true
      t.string :url_excel_file
      t.integer :approved, default: 0

      t.timestamps
    end
    add_index :user_tasks, [:user_id, :course_subject_task_id], unique: true
  end
end
