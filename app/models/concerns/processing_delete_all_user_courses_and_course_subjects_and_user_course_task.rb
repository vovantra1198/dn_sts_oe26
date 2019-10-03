module ProcessingDeleteAllUserCoursesAndCourseSubjectsAndUserCourseTask
  class << self
    def excute course
      @user_courses = CourseUser.by_course_id course.id
      @user_course_tasks = UserCourseTask.by_course_id course.id
      @course_subjects = CourseSubject.by_course_id course.id
      @user_course_subjects = UserCourseSubject.by_course_subjects(@course_subjects.pluck(:id))
      begin
        @user_courses.update_all deleted: Settings.deleted_1
        @user_course_tasks.update_all deleted: Settings.deleted_1
        @course_subjects.update_all deleted: Settings.deleted_1
        @user_course_subjects.update_all deleted: Settings.deleted_1
      rescue => e
        @message = e.message
      end
    end

    def get_message
      @message
    end
  end
end
