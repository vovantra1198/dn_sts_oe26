class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :course_users, dependent: :destroy
  has_many :courses, through: :course_users
  has_many :user_subjects, dependent: :destroy
  has_many :subjects, through: :user_subjects
  has_many :user_tasks, dependent: :destroy
  has_many :course_subject_tasks, through: :user_tasks
  has_many :histories, dependent: :destroy

  enum role: [:trainee, :trainer, :admin]
  validates :name, presence: true,
    length: {maximum: Settings.user.max_length_name}
  validates :email, presence: true,
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false},
    confirmation: true
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.user.min_length_password},
    confirmation: true
end
