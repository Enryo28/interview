class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller? 
 
  
  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation, :image, :image_name ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
  
  
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  
  
  def authenticate_user
    unless user_signed_in?
      flash[:notice] = "ログインが必要です"
      redirect_to root_path
    end
  end
  
  

  def current_user
    return unless session[:user_id]
    @current_user = User.find(session[:user_id])
  end
      
  
end
