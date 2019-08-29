class Task < ApplicationRecord
  belongs_to :subject

  validates :subject_id, presence: true
  validates :title, presence: true,
    length: {maximum: Settings.task.max_length_title}
  validates :content, presence: true,
    length: {maximum: Settings.task.max_length_details}
end
