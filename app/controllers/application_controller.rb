class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    if admin_user_signed_in?
      admin_dashboard_path
    elsif user_signed_in?
    index_path
    end
  end

end
