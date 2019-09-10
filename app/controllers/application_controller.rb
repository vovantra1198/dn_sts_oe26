class ApplicationController < ActionController::Base
  include SessionsHelper
  include NotificationsHelper
  protect_from_forgery with: :exception
  before_action :set_locale
  layout :dynamic_layout

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def dynamic_layout
    current_user&.admin? ? "admin" : "application"
  end

  def user_not_authorized
    flash[:warning] = t ".not_authorized"
    redirect_to(request.referrer || root_path)
  end
end
