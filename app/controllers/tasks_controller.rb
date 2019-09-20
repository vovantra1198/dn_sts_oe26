class TasksController < ApplicationController
  before_action :load_task, only: [:edit, :update, :destroy]

  def edit; end

  def update
    respond_to do |format|
      if @task.update_attributes task_params
        flash[:success] =  t "users.show.update_success"
        format.html {redirect_to course_subject_path(course_id: params[:task][:course_id],
                                                     id: params[:task][:subject_id])}
      else
        format.js
      end
    end
  end

  def destroy; end

  private

  def load_task
    @task = Task.find_by id: params[:id]
    return if @task
    flash["danger"] = t ".courses.notfound.notfound"
    redirect_to notfound_path
  end

  def task_params
    params.require(:task).permit :title, :content
  end
end
