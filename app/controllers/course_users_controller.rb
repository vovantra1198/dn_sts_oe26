class CourseUsersController < ApplicationController
  before_action :check_trainer
  before_action :load_course_user, only: :destroy

  def create
    @course_user = CourseUser.new course_user_params
    if @course_user.save
      flash[:success] = t ".add_success"
      redirect_to course_path(id: params[:course_user][:course_id], join_date: params[:course_user][:join_date] )
    else
      flash[:danger] = t ".not_success"
      redirect_to notfound_path
    end
  end

  def destroy
    if @course_user.destroy
      flash[:success] = t ".delete_success"
      redirect_to course_path(id: params[:course_id], join_date: params[:join_date] )
    else
      flash[:danger] = t ".delete_fail"
      redirect_to notfound_path
    end
  end

  private

  def load_course_user
    @course_user = CourseUser.find_by(id: params[:id])
    return if @course_user
    flash["danger"] = t "courses.notfound.notfound"
    redirect_to notfound_path
  end

  def course_user_params
    params.require(:course_user).permit :user_id, :course_id, :join_date
  end

  def check_trainer
    unless current_user.trainer?
      flash[:danger] = t "course_users.create.not_trainer"
      redirect_to notfound_path
    end
  end
end
