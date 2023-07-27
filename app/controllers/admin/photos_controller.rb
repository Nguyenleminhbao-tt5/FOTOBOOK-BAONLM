module Admin
    class PhotosController < ApplicationController
        before_action :check_admin
        def index
            @pagy, @list_photo = pagy(Photo.all.order(created_at: :desc), items: 12)        
        end

        private

        def check_admin
            if current_user&.user_type != 'admin' 
                redirect_to root_path
            end
        end

    end
end