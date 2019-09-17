class SubjectsController < ApplicationController
  before_action :load_subject, only: :show

  def show
    @course_user = current_user.course_users.find_by(course_id: params[:course_id])
    user_ids = User.with_by_course_user_course_subject
                   .by_course_id_subject_id_join_date(@subject.id, @course_user.course_id, @course_user
                   .join_date).pluck("users.id")
    @users = User.select_users_and_count_tasks
                 .with_by_user_course_tasks
                 .by_user_id(user_ids)
                 .group_by_id
  end

  private

  def load_subject
    @subject = Subject.find_by(id: params[:id])
    return if @subject
    flash["danger"] = t ".courses.notfound.notfound"
    redirect_to notfound_path
  end
end
