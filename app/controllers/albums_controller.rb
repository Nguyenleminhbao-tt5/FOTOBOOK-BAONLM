class AlbumsController < ApplicationController
    before_action :album_params, only: [  :update, :create ]


    def new
        @album = current_user.albums.new
        render :new
    end

    def create
        @album= current_user.albums.new(album_params)
        #render :json => params
        respond_to do |format|
            format.html do
                p @album.save
                if @album.save
                    flash[:success] = "New album item successfully added!"
                    redirect_to albums_user_url(current_user)
                    
                else
                    flash.now[:error] = "Album item creation failed"
                    render :new
                end
            end
        end
    end

    def edit 
        @album = Album.find(params[:id])
        render :edit
    end

    def update
        @album = Album.find(params[:id])
        # render :json => params
        respond_to do |format|
            format.html do
              if @album.update(album_params)
                # success message
                # redirect to index
                flash[:success] = "Album successfully updated!"
                
                if current_user.user_type == 'admin'
                    redirect_to admin_albums_url
                else
                    redirect_to albums_user_url(current_user)
                end
                
              else
                # error message
                # render edit
                flash.now[:error] = "Album update failed"
                render :edit , status: 422
              end
            end
        end

    end

    def destroy
        @album=Album.find(params[:id])
        @album.destroy
        flash[:success] = "The album was successfully destroyed."
        if current_user.user_type == 'admin'
            redirect_to admin_albums_url
        else
            redirect_to albums_user_url(current_user)
        end
    end


    private

   
    def album_params
        params.require(:album).permit(:title, :description, :mode, {list_image: []})
    end
end
