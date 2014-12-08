class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    wikis_path
  end

protected
     
     def user_not_authorized
       flash[:error] = "You are not authorized to perform this action."
       redirect_to(request.referrer || root_path)
     end
     
     def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) << :name
     end
end
