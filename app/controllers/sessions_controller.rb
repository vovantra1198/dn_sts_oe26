class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    respond_to do |f|
      if user&.authenticate(params[:session][:password])
        log_in user
        f.html{redirect_to root_path}
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
