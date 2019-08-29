class CourseSubjectTask < ApplicationRecord
  belongs_to :course_subject
  belongs_to :task
  has_many :user_tasks, dependent: true

  validates :course_subject_id, presence: true
  validates :task_id, presence: true
end
