class UsersController < ApplicationController
  def new
    @user = User.new
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
end
