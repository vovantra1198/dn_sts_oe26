module ProcessingDeleteAllSubject
  def self.excute task
    @user_course_tasks = task.user_course_tasks
    return unless @user_course_tasks
    begin
      @user_course_tasks.destroy_all
    rescue  => e
      puts e.message
    end
  end
end
