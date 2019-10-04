class Course < ApplicationRecord

  has_many :course_users, dependent: :destroy
  has_many :users, through: :course_users
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  has_many :user_course_tasks, dependent: :destroy
  has_many :users, through: :user_course_tasks
  has_many :tasks, through: :user_course_tasks

  after_update :delete_all_user_courses_and_course_subjects_and_user_course_task

  enum location: {da_nang: 0, tp_hcm: 1, ha_noi: 2}
  enum status: {archive: 0, running: 1, finish: 2}
  validates :name, presence: true,
    length: {maximum: Settings.course.max_length_name}
  validates :content, presence: true,
    length: {maximum: Settings.course.max_length_content}

  scope :order_by_created_at, ->{order :created_at}
  scope :by_deleted_false, ->{where deleted: false}

  private

  def delete_all_user_courses_and_course_subjects_and_user_course_task
    return unless self.deleted?
    ProcessingDeleteAllUserCoursesAndCourseSubjectsAndUserCourseTask.excute(self)
  end
end
