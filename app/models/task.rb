class Task < ApplicationRecord

  belongs_to :subject
  has_many :user_course_tasks, dependent: :destroy
  has_many :users, through: :user_course_tasks
  has_many :courses, through: :user_course_tasks

  after_destroy :delete_all_subject

  validates :subject_id, presence: true
  validates :title, presence: true,
    length: {maximum: Settings.task.max_length_title}
  validates :content, presence: true,
    length: {maximum: Settings.task.max_length_content}

  scope :by_subject_id, ->(subject_id){where("subject_id = ?", subject_id)}

  def delete_all_subject
    ProcessingDeleteAllSubject.excute(self)
  end
end
