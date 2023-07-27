class ApplicationController < ActionController::Base
    include Pagy::Backend

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :load_messenger
    add_flash_types :success, :error, :warning
    layout :set_layout

    def catch_all
        flash.now[:error] = "Invalid URL. You have been redirected to the home page."
        redirect_to root_path
    end
    

    protected

    def set_layout
        if current_user&.user_type == 'admin'
            'admin'
        else
            'application'
        end
    end

    def load_messenger
        @list_message= Message.last(10)
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :user_type, :age, :fname, :lname])
        devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :lname, :email, :avatar, :active])
    end

 
end
