class CreateUserCourseSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_course_subjects do |t|
      t.references :course_subject, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 2
      t.integer :duration
      t.integer :order
      t.timestamps
    end
  end
end
