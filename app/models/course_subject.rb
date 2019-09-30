class CourseSubject < ApplicationRecord
  belongs_to :course
  belongs_to :subject

  has_many :user_course_subjects, dependent: :destroy
  has_many :users, through: :user_course_subjects

  enum status: {no_active: 0, running: 1, finish: 2}
  validates :course_id, presence: true
  validates :subject_id, presence: true
  scope :select_subjects, (lambda do
    select("subjects.id as subject_id,subjects.name as subject_name,
            subjects.duration_default as subject_duration,
            subjects.details as subject_details, course_subjects.status")
  end)
  scope :with_subjects, ->{joins(" join subjects on course_subjects.subject_id = subjects.id")}
  scope :sort_by_order, ->{order :order}
  scope :by_user_id, ->(user_id) {where user_id: user_id}
  scope :by_course_id, ->(course_id) {where course_id: course_id}

end
