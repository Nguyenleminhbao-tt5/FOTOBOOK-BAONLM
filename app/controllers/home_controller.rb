class HomeController < ApplicationController

    def feed
        if user_signed_in?            
            list_id_following = current_user.follows_as_follower.pluck(:follower_id)

            @pagy, @list_photo = pagy(Photo.where(user_id: list_id_following).order(created_at: :desc), items: 8)
            @pagy, @list_album = pagy(Album.where(user_id: list_id_following).order(created_at: :desc), items: 8)
        else 
            @pagy, @list_photo = pagy(Photo.all.order(created_at: :desc), items: 8)
            @pagy, @list_album = pagy(Album.all.order(created_at: :desc), items: 8)
        end
    end

    def discover
        @list_id_following = current_user.follows_as_follower.pluck(:follower_id) if user_signed_in?
        @pagy, @list_photo = pagy(Photo.all.order(created_at: :desc), items: 8)
        
        @pagy, @list_album = pagy(Album.all.order(created_at: :desc), items: 8)
    end

end