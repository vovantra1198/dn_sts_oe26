class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject
  has_many :course_subject_tasks, dependent: :destroy
  has_many :tasks, through: :course_subject_tasks

  enum status: [:no_active, :running, :finish]
  validates :course_id, presence: true
  validates :subject_id, presence: true
end
