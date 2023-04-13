class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :set_layout

  private


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name image])
  end

  def set_layout
    if current_user
      'application'
    else
      'auth'
    end
  end  
end
