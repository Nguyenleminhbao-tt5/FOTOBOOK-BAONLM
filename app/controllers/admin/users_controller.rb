module Admin
    class UsersController < ApplicationController

        before_action :user_params , only: [:update]
        before_action :check_admin

        def index   
            @users= User.all
            @pagy, @users = pagy(User.all, items: 20)
        end
    
        def edit
            @user = User.find(params[:id])
            render :edit
        end
    
        def update
            @user = User.find(params[:id])
            respond_to do |format|
                format.html do
                  if @user.update(user_params)
                    flash[:success] = "User updated successfully"
                    redirect_to admin_users_url                
                  else
                    flash.now[:error] = "User updated failed"
                    render :edit, status: 422
                  end
                end
              end
        end
    
        def destroy
            @user=User.find(params[:id])
            @user.destroy
            flash[:success] = "User was successfully destroyed."
            redirect_to admin_users_url                
        end
        
        private 
        
        def user_params
            params.require(:user).permit(:fname, :lname, :email, :avatar, :active, :password)
        end

        def check_admin
            if current_user&.user_type != 'admin' 
                redirect_to root_path
            end
        end
    end
end