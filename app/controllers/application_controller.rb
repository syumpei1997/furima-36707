class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:new]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :name, :furigana_last_name, :furigana_name, :birthday])
  end
  
end
