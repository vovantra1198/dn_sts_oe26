class Admin::UsersController < AdminController
  before_action :load_user, except: :index
  before_action :load_params, only: :index
  def index
    @users = User.load_users(@type).order_by.paginate page: @page,
      per_page: Settings.per_page
  end

  def destroy
    if @user.delete
      flash[:info] = t(".delete_success", name: @user.name)
    else
      flash[:info] = t(".delete_fail", name: @user.name)
    end
    redirect_to request.referrer
  end

  def update
    if @user.activate
      flash[:info] = t(".active_success", name: @user.name)
    else
      flash[:info] = t(".active_fail", name: @user.name)
    end
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
