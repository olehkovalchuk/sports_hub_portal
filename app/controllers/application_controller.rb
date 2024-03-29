class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # load_and_authorize_resource unless: :devise_controller?
  add_flash_types :danger, :success
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_path, danger: "Unauthorized Access!"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)} 
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password)}
  end
end
