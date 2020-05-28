class ApplicationController < ActionController::Base
    before_action :get_category
    before_action :configure_permitted_parameters, if: :devise_controller?

    def get_category
      @categories = Category.all
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    end
end
