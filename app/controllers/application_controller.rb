# encoding: UTF-8
#
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_action :previous_page

  protected

  def configure_devise_permitted_parameters
    registration_params = [:first_name, :last_name, :email,
                           :email_confirmation, :password,
                           :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(registration_params << :current_password) }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(registration_params) }
    end
  end

  # used to return to previous url
  # implemented specifically for use when searching, so that when clicking 'back'
  # from a product you return to the search page
  def previous_page
    session[:previous_url] = request.referer
  end
end
