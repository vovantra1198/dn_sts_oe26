class AdminController < ApplicationController
  before_action :is_admin

  def is_admin
    return if current_user.admin?
    flash[:danger] = t "edit.not_admin"
    redirect_to notfound_path
  end
end
