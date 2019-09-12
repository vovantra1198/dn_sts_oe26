class Task < ApplicationRecord
  belongs_to :subject
  has_many :user_course_tasks, dependent: :destroy
  has_many :users, through: :user_course_tasks
  has_many :courses, through: :user_course_tasks
  validates :subject_id, presence: true
  validates :title, presence: true,
    length: {maximum: Settings.task.max_length_title}
  validates :content, presence: true,
    length: {maximum: Settings.task.max_length_content}
end
