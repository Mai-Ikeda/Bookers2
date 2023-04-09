class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      user_path(current_user)
    end

    def set_current_user
      @current_user = User.find(params[:id])
    end

    def move_to_signed_in
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
      # devise_parameter_sanitizer.permit(:account_update, keys:[:name, :profile_image, :introduction])
    end
end
