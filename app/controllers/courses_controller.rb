class CoursesController < ApplicationController
  before_action :load_course, only: :show
  def index
    @course_ids = current_user.course_users
  end

  def show
    @course_subjects = @course.course_subjects.select_subjects
                              .with_subjects
                              .sort_by_order
    @user_courses = @course.course_users.by_join_date(params[:join_date])
    @user_couser_tasks = current_user.user_course_tasks
                                     .select_user_course_tasks
                                     .with_task_subject.find_by_course(@course.id)
    @user_task_ids = @course.user_course_tasks.select_user_course_tasks_subjects
                            .with_tasks_user_course_subject
                            .by_user_id(@user_courses.pluck(:user_id))
  end

  private

  def load_course
    @course = Course.find_by(id: params[:id])
    return if @course
    flash["danger"] = t "courses.notfound.notfound"
    redirect_to notfound_path
  end
end
