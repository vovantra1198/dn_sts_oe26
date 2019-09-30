class UserCourseSubject < ApplicationRecord
  belongs_to :course_subject
  belongs_to :user

  enum status: {finish: 0, running: 1, no_active: 2}

  scope :by_user_id, ->(user_id){where(user_id: user_id)}
  scope :sort_by_order,-> {order :order}
end
