class Course < ApplicationRecord
  attr_accessor :locations, :statuses

  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects

  enum location: {da_nang: 0, tp_hcm: 1, ha_noi: 2}
  enum status: {archive: 0, running: 1, finish: 2}
  validates :name, presence: true,
    length: {maximum: Settings.course.max_length_name}
  validates :content, presence: true,
    length: {maximum: Settings.course.max_length_content}
end
