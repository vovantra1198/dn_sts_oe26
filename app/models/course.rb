class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects

  enum status: [:no_active, :running, :finish]
  validates :name, presence: true,
    length: {maximum: Settings.course.max_length_name}
  validates :content, presence: true,
    length: {maximum: Settings.course.max_length_content}
end
