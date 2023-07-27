class PhotosController < ApplicationController
   before_action :photo_params, only: [  :update, :create ]


    def new
        @photo = current_user.photos.new
        render :new
    end

    def create


        @photo= current_user.photos.new(photo_params)
        respond_to do |format|
            format.html do
                if @photo.save
                    flash[:success] = "New photo added successfully!"
                    redirect_to photos_user_url(current_user)
                else
                    flash.now[:error] = "Photo creation failed"
                    render :new , status: 422
                end
            end
        end
    end

    def edit 
        @photo = Photo.find(params[:id])
        render :edit
    end

    def update
        @photo = Photo.find(params[:id])
        respond_to do |format|
            format.html do
              if @photo.update(photo_params)
                # success message
                # redirect to index
                flash[:success] = "Photo successfully updated!"
                if current_user.user_type == 'admin'
                    redirect_to admin_photos_url
                else
                    redirect_to photos_user_url(current_user)
                end
                
              else
                # error message
                # render edit
                flash.now[:error] = "Photo update failed"
                render :edit , status: 422
              end
            end
          end

    end

    def destroy
        @photo=Photo.find(params[:id])
        @photo.destroy
        flash[:success] = "The photo item was successfully destroyed."
        if current_user.user_type == 'admin'
            redirect_to admin_photos_url
        else
            redirect_to photos_user_url(current_user)
        end
    end

    private


    def photo_params
        params.require(:photo).permit(:title, :description, :mode, :source)
    end
end
