class UserCourseTask < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :task

  after_update :processing_count_subject

  enum status: {submitted: 0, passed: 1}

  validates :course_id, presence: true
  validates :user_id, presence: true
  validates :task_id, presence: true
  has_attached_file :file_excel,
    url: "/policy_documents/:id/:basename.:extension",
    path: "#{Rails.root}/public/policy_documents/:id/:basename.:extension"
  do_not_validate_attachment_file_type :file_excel

  scope :find_by_course, ->(course_id){where "course_id = ?", course_id}
  scope :select_user_course_tasks, lambda { select("user_course_tasks.*,
                                                    tasks.title as task_title,
                                                    subjects.name as subject_name") }
  scope :with_task_subject, lambda {joins("Join tasks on tasks.id = user_course_tasks.task_id
                                           Join subjects on tasks.subject_id = subjects.id")}
  scope :select_user_course_tasks_subjects, lambda{select("user_course_tasks.*,
                                                           subjects.name as subject_name,
                                                           tasks.title as task_title,
                                                           users.name as user_name")}
  scope :with_tasks_user_course_subject, lambda {joins("join tasks on user_course_tasks.task_id = tasks.id
                                                        join users on users.id = user_course_tasks.user_id
                                                        join subjects on subjects.id = tasks.subject_id")}
  scope :by_user_id, lambda {|user_id| where("user_course_tasks.user_id" => user_id)}

  scope :by_user_id_subject_id_course_id, lambda {|user_id,subject_id, course_id| where("user_course_tasks.user_id" => user_id,
                                                                             "user_course_tasks.course_id" => course_id,
                                                                             "tasks.subject_id" => subject_id)}
  def processing_count_subject
    ProcessingCourseSubject.execute(self)
  end
end
