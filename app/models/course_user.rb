class CourseUser < ApplicationRecord
  belongs_to :course
  belongs_to :user

  enum status: [:joinning, :joined]
  validates :course_id, presence: true
  validates :user_id, presence: true
end
