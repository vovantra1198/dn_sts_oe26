class CourseUser < ApplicationRecord
  belongs_to :course
  belongs_to :user

  enum status: {joinning: 0, joined: 1}
  validates :course_id, presence: true
  validates :user_id, presence: true
  scope :by_join_date, -> (join_date) {where(join_date: join_date)}
  scope :find_by_course, ->(course_id){where "course_id = ?", course_id}
  scope :select_subject, lambda {select("subjects.name as subject_name, subjects.details as subject_details,
                                         course_subjects.status as subject_status ")}
  scope :with_course_course_subject_subject, lambda{joins("join courses on course_users.course_id = courses.id
                                                           join course_subjects on courses.id = course_subjects.course_id
                                                           join subjects on course_subjects.subject_id = subjects.id")}
end
