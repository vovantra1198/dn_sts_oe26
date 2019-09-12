class CoursesController < ApplicationController
  before_action :load_course, only: :show
  def index
    @course_ids = current_user.course_users.joinning
  end

  def show
    @course_subjects = @course.course_subjects.select_subjects.with_subjects.sort_by_order
    @user_courses = @course.course_users.joinning
    @user_couser_tasks = current_user.user_course_tasks.select_user_course_tasks.with_task_subject.find_by_course(@course.id)
  end

  private
  def load_course
    @course = Course.find_by(id: params[:id])
    return if @course
    flash["danger"] = t "courses.notfound.notfound"
    redirect_to notfound_path
  end
end
