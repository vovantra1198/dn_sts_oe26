module ProcessingCourseSubject
  class << self
    def execute user_course_task
      return unless user_course_task&.passed?
      subject_id = user_course_task.task.subject_id
      user_id = user_course_task.user_id
      course_id = user_course_task.course_id
      return unless passed_subject?(user_id, course_id, subject_id)
      update_status_course_subject(course_id, subject_id)
    end

    def passed_subject? user_id, course_id, subject_id
      total_subject_tasks = Task.by_subject_id(subject_id).size
      passed_subject_tasks = UserCourseTask.joins(:task)
                                           .by_user_id_subject_id_course_id(user_id,subject_id, course_id)
                                           .passed.size
      total_subject_tasks == passed_subject_tasks
    end

    def update_status_course_subject course_id, subject_id
      course_subject = CourseSubject.find_by(course_id: course_id, subject_id: subject_id)
      return if course_subject.blank?
      begin
        course_subject.finish!
        update_status_course_subject_next(course_id, course_subject.order)
      rescue  => e
        puts e.message
      end
    end

    def update_status_course_subject_next course_id, course_subject_order
      course_subject = CourseSubject.find_by(course_id: course_id,
                                             order: course_subject_order + Settings.order_1,
                                             status: Settings.status_0)
      return if course_subject.blank?
      begin
        course_subject.running!
      rescue  => e
        puts e.message
      end
    end
  end
end
