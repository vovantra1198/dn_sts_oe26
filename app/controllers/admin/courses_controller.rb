class Admin::CoursesController < ApplicationController
  before_action :load_course, only: [:edit, :update]

  def index
    @courses = Course.by_deleted_false.order_by_created_at.paginate page: params[:page], per_page: Settings.per_page
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
end
