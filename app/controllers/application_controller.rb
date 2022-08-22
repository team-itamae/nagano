class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
   

  def after_sign_up_path_for(resource)
    customers_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_sei,:name_mei,:kana_sei,:kana_mei,:post_code,:address,:phone_number])
  end

  
end
