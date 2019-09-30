module ProcessingDeleteAllUserCourseTaskAndSubject
  def self.excute course_user
    @user_course_tasks = UserCourseTask.by_user_id(course_user.user_id)
    @user_course_subjects = UserCourseSubject.by_user_id(course_user.user_id)
    begin
      ActiveRecord::Base.transaction do
        @user_course_tasks.destroy_all
        @user_course_subjects.destroy_all
      end
    rescue => e
      puts e.message
    end
  end
end
