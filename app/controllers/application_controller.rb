class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do | exception |
  	redirect_to root_url, alert: exception.message
  end

  class Amount 

    def default=(pennies)
      @pennies = pennies
    end

    def default
      @pennies * 100
    end
  end

   
protected
   
     def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) << :name
     end
end
