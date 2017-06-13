class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def after_sign_in_path_for(resource)
  #   if user_signed_in?
  #     settings_path
  #   elsif admin_user_signed_in?
  #     admin_dashboard_path
  #   end
  # end

end
