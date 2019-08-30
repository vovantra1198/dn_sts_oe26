class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :genders, :roles

  has_many :course_users, dependent: :destroy
  has_many :courses, through: :course_users
  has_many :user_subjects, dependent: :destroy
  has_many :subjects, through: :user_subjects
  has_many :user_tasks, dependent: :destroy
  has_many :course_subject_tasks, through: :user_tasks
  has_many :histories, dependent: :destroy

  enum gender: {male: 0, female: 1, other: 2}
  enum role: {trainee: 0, trainer: 1, admin: 2}
  validates :name, presence: true,
    length: {maximum: Settings.user.max_length_name}
  validates :email, presence: true,
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.user.min_length_password}

  before_save :email_downcase

  private

  def email_downcase
    email.downcase!
  end
end