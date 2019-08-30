class History < ApplicationRecord
  belongs_to :user
  belongs_to :course_subject

  validate :user_id, presene: true
end
