# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  #   @room = Room.new
  # end

  # POST /resource
  # def create
  #   super
  #   @room = Room.new(room_params)
  # end

  # GET /resource/edit
  def edit
    super
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.image_name = params[:image_name]
    @room.job_world = params[:job_world]
    @room.job_contents = params[:job_contents]
    @room.room_condition = params[:room_condition]
    @room = Room.find_by(id: params[:id])
    
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
  
 private
  def room_params
    params.require(:room).permit(:job_world, :job_contents, :room_condition).merge(user_id: current_user.id)
  end
  
  def user_params
    params.require(:user).permit(:name, :image_name, :email, :password, :password_confirmation)
  end

  
end
