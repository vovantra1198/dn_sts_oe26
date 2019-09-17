class Admin::UsersController < AdminController
  before_action :load_user, except: :index
  before_action :load_params, only: :index
  def index
    @users = User.load_users(@type).order_by.paginate page: @page,
      per_page: Settings.per_page
  end

  def destroy
    key = @user.delete ? ".delete_success" : ".delete_fail"
    flash[:info] = t(key, name: @user.name)
    redirect_to request.referrer
  end

  def update
    key = @user.activate ? ".active_success" : ".active_fail"
    flash[:info] = t(key, name: @user.name)
    redirect_to request.referrer
  end

  private

  def load_user
    @user = User.find_by(id: params[:id])
    return if @user
    render "shared/not_found"
  end

  def load_params
    @page = params[:page]
    @type = params[:type]
  end
end
