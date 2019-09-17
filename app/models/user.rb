class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessor :genders, :roles

  has_many :course_users, dependent: :destroy
  has_many :courses, through: :course_users
  has_many :user_course_tasks, dependent: :destroy
  has_many :courses, through: :user_course_tasks
  has_many :tasks, through: :user_course_tasks
  has_many :histories, dependent: :destroy

  enum gender: {male: 0, female: 1, other: 2}
  enum role: {trainee: 0, trainer: 1, admin: 2}
  validates :name, presence: true,
    length: {maximum: Settings.user.max_length_name}
  validates :email, presence: true,
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :birthday, presence: true
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.user.min_length_password}
  before_save :email_downcase

  scope :load_users, ->(type) do
    type ? where(activated: type) : where(activated: [true, false])
  end

  scope :order_by, ->{order(created_at: :desc)}

  def activate
    update_columns(activated: true, updated_at: Time.zone.now)
  end
  scope :with_by_course_user_course_subject, lambda {joins("left outer join course_users on users.id = course_users.user_id
                                                            left outer join courses on course_users.course_id = courses.id
                                                            left outer join course_subjects on course_subjects.course_id = courses.id")}
  scope :by_course_id_subject_id_join_date,
          lambda {|subject_id, course_id, join_date| where("course_subjects.subject_id" => subject_id,
                                                           "courses.id" => course_id,
                                                           "course_users.join_date" => join_date)}
  scope :select_users_and_count_tasks, lambda {select("users.*, count(user_course_tasks.user_id) as count_tasks")}
  scope :with_by_user_course_tasks, lambda {joins("left outer join user_course_tasks on users.id = user_course_tasks.user_id")}
  scope :by_id,-> (id) {where "users.id = ?", id}
  scope :group_by_id, lambda {group("id")}
  scope :by_user_id, lambda{|id| where("id" => id )}

  private

  def email_downcase
    email.downcase!
  end

end
