class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :email, :password,
      :password_confirmation, :remember_me,:gender,:date_of_birth,:name ,:avatar, :avatar_cache) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password,
      :password_confirmation, :current_password, :gender,:date_of_birth,:name,:avatar, :avatar_cache) }
  end
end
