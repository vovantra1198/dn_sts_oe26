class Subject < ApplicationRecord
  has_many :course_subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :users, through: :user_subjects

  validates :name, presence: true,
    length: {maximum: Settings.subject.max_length_name}
  validates :details, presence: true,
    length: {maximum: Settings.subject.max_length_details}
  validates :duration_default, presence: true
end
