class Admin::CoursesController < ApplicationController
  before_action :load_course, only: [:edit, :destroy, :update]
  after_action :message_exeption, only: :destroy

  def index
    @q = Course.ransack(params[:q])
    @courses = if params[:q].nil?
      Course
    else
      @q.result(distinct: true)
    end.order_by_created_at.paginate page: params[:page], per_page: Settings.per_page
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new courses_param
    if @course.save
      flash[:success] = t ".created_success"
      redirect_to admin_courses_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @course.update_attributes courses_param
      flash[:success] = t ".update_success"
      redirect_to admin_courses_path
    else
      render :edit
    end
  end

  def destroy
    if @course.update_attribute :deleted, Settings.deleted_1
      flash[:success] = t ".delete_success", name: @course.name
      redirect_to admin_courses_path
    else
      flash[:danger] = t ".delete_fail", name: @course.name
      redirect_to admin_courses_path
    end
  end

  def search
    index
    render :index
  end

  private

  def courses_param
    params.require(:course).permit :name, :content, :start_date, :status, :location, :deleted
  end

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash["danger"] = t "courses.notfound.notfound"
    redirect_to notfound_path
  end

  def message_exeption
    @message = ProcessingDeleteAllUserCoursesAndCourseSubjectsAndUserCourseTask.get_message
    return unless @message
    flash[:danger] = @message
  end
end
