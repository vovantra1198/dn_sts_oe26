class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def show
    @course_users = @user.course_users.select_subject
                         .with_course_course_subject_subject.joinning
  end

  def create
    @user = User.new user_params
    if @user.valid?
      session[:code] = rand(100_000..999_999)
      session[:user_params] = user_params
      UserMailer.confirm_email(user_params[:email], session).deliver_now
      flash[:info] = t ".check_mail_code"
      render :confirm_email
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "users.show.update_success"
      redirect_to @user
    else
      render :edit
    end
  end

  def confirm_email; end

  def check_code
    unless session[:code] || session[:user_params]
      flash[:danger] = t ".code_expire"
      redirect_to signup_path
      return
    end
    if session[:code].to_i == code_params[:code].to_i
      @user = User.new session[:user_params]
      @user.save
      flash[:info] = t ".messages_wait_active"
      redirect_to root_url
      session.delete(:code)
      session.delete(:user_params)
      create_notify(t(".notify_new_create_account"), "#", 0)
    else
      flash.now[:danger] = t ".code_not_confirm"
      render :confirm_email
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :birthday, :gender, :company, :gradution,
      :university, :address, :role
  end

  def code_params
    params.require(:confirm).permit :code
  end

  def load_user
    @user = User.find_by(id: params[:id])
    return if @user
    flash["danger"] = t "courses.notfound.notfound"
    redirect_to notfound_path
  end
end
