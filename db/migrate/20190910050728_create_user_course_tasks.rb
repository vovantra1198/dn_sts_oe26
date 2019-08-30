class CreateUserCourseTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_course_tasks do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.references :task, foreign_key: true
      t.string :file_excel
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
