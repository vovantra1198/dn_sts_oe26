class CreateCourseSubjectTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :course_subject_tasks do |t|
      t.references :course_subject, foreign_key: true
      t.references :task, foreign_key: true
      t.integer :order

      t.timestamps
    end
    add_index :course_subject_tasks, [:course_subject_id, :task_id],
      unique: true
  end
end
