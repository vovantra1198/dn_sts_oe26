class UserCourseTasksController < ApplicationController
  def create
    @usercoursetaskser = current_user.user_course_tasks.build user_course_task_params
    respond_to do |format|
      if @usercoursetaskser.save
        flash[:success] = t "subjects.show.submit"
        format.html{redirect_to course_path(@usercoursetaskser.course_id)}
      else
        format.js
      end
    end
  end

  private

  def user_course_task_params
    params.require(:usercoursetask).permit :course_id, :task_id, :file_excel
  end
end
