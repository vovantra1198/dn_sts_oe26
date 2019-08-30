class UserTasksController < ApplicationController
  def new
    @usertasks = UserTask.new
  end

  def create
    @usertask = current_user.user_tasks.build user_task_params
  end

  private

  def user_task_params
    params.require(:usertask).permit :course_subject_task_id, :url_excel_file
  end
end
