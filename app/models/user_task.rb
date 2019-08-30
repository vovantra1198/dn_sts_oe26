class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :course_subject_task

  enum approved: [:no, :yes]
  validates :user_id, presence: true
  validates :course_subject_task_id, presence: true
end
