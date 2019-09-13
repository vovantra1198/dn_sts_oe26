class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    respond_to do |f|
      if user&.authenticate(params[:session][:password])
        log_in user
        if user.admin?
          f.html{redirect_to admin_users_path}
        else
          f.html{redirect_to courses_path}
        end
      else
        f.js {}
      end
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
