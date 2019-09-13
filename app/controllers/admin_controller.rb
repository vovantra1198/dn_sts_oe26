class AdminController < ApplicationController
  before_action :require_admin

  def require_admin
    unless current_user&.admin?
      flash[:danger] = t ".not_access"
      redirect_to root_path
    end
  end
end
