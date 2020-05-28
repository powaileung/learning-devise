class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #these codes are written inside configure_permitted_parameters function
  protected
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:signin)}
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :username, :password, :password_confirmation)}
  end

end
