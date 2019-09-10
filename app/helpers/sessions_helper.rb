module SessionsHelper
  def log_in user
    session[:user_id] = user.id
    cookies.permanent.signed[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user? user
    user == current_user
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
    cookies.delete :user_id
    @current_user = nil
  end

  def current_user? user
    user == current_user
  end

  def get_sub_user
    @sub_user = []
    if current_user.trainee?
      # get sub trainee
    elsif current_user.trainer?
      # get sub trainer
    elsif current_user.admin?
      @sub_user << 0
      @sub_user + Course.ids
    end
    @sub_user
  end
end
