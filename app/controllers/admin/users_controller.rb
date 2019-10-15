class Admin::UsersController < AdminController
  before_action :load_user, except: [:index, :new, :create, :search]
  after_action :message_exeption, only: :destroy

  def index
    @q = User.ransack(params[:q], auth_object: set_ransack_auth_object)
    @users = if params[:q].nil?
      User
    else
      @q.result(distinct: true).includes(:tasks)
    end.order_by.paginate page: params[:page], per_page: Settings.per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params_user
    if @user.save
      flash[:success] = t ".created_success"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def destroy
    key = @user.update_attribute(:deleted, Settings.deleted_1) ? ".delete_success" : ".delete_fail"
    flash[:info] = t(key, name: @user.name)
    redirect_to request.referrer
  end

  def update
    if @user.update_attributes params_user
      flash[:success] = t ".update_success"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def search
    index
    render :index
  end

  private

  def load_user
    @user = User.find_by(id: params[:id])
    return if @user
    render "shared/not_found"
  end

  def params_user
    params.require(:user).permit :name, :email,
                                 :password, :password_confirmation,
                                 :birthday, :company, :gradution,
                                 :university, :address, :role, :gender, :deleted
  end

  def message_exeption
    @message = ProcessingDeleteUserCourseTasksAndUserCourseSubjectAndUserCourse.get_message
    return unless @message
    flash[:danger] = @message
  end

  def set_ransack_auth_object
    current_user.admin? ? :admin : nil
  end
end
