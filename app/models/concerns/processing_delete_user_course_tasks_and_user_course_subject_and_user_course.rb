module ProcessingDeleteUserCourseTasksAndUserCourseSubjectAndUserCourse
  class << self
    def excute user
      @user_courses = CourseUser.by_user_id user.id
      @user_course_tasks = UserCourseTask.by_user_id user.id
      @user_course_subjects = UserCourseSubject.by_user_id user.id
      begin
        @user_courses.update_all deleted: Settings.deleted_1
        @user_course_tasks.update_all deleted: Settings.deleted_1
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
