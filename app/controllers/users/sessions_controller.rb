# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  layout :set_layout
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
      user_signed_in? if user.active
      if user.user_type == "admin"
        flash[:success] = 'Admin login successfully'
        redirect_to admin_photos_url
      elsif user.user_type == "client" 
        if !user.active 
          flash[:error]= 'You are logged in'
          return redirect_to login_url
        else
         
          flash[:success] = "#{user.lname} login successfully"
          redirect_to root_path
        end
      end 
    else
      flash[:error]= 'Login Failed'
      redirect_to login_url
    end
    
    
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def set_layout
    if current_user&.user_type == 'admin'
        'admin'
    else
        'application'
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
