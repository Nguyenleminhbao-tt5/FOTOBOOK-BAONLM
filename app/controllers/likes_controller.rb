class LikesController < ApplicationController
    before_action :authenticate_user!
    
    def like_photo

        photo = Photo.find(params[:id])
        exsit_like = current_user.like_photos.find_by(photo_id: params[:id])

        is_like= params[:is_like]
        if is_like == "true" and !exsit_like
            current_user.like_photos.create(photo_id: params[:id]) 
        elsif is_like == "false" and exsit_like
            exsit_like.destroy
        end


        update_like_photo(params[:id],photo.like_photos.size , is_like)


    end

    def like_album


        album = Album.find(params[:id])
        exsit_like = current_user.like_albums.find_by(album_id: params[:id])

        is_like= params[:is_like]
        if is_like == "true" and !exsit_like
            current_user.like_albums.create(album_id: params[:id]) 
        elsif is_like == "false" and exsit_like
            exsit_like.destroy
        end


        update_like_album(params[:id],album.like_albums.size , is_like)

    end

    private

    def update_like_photo(photo_id,photo_like_size,is_like)
        

        if is_like == 'true'
            render turbo_stream:
                turbo_stream.replace("like_count_photo_#{photo_id}",
                    inline:  "
                    <%= turbo_frame_tag 'dislike_count_photo_#{photo_id}' do %>
                        <%= button_to like_photo_path(#{photo_id}, 'false'),class: 'cardImg__right-footer__btn border-0 bg-transparent' do %>
                            <i class='heart-icon like fa-solid fa-heart'></i>
                            <span>#{photo_like_size}</span>
                        <%end%>
                    <%end%>
                    
                    " )
        elsif is_like =='false'
            render turbo_stream:
                turbo_stream.replace("dislike_count_photo_#{photo_id}",
                    inline:  "
                    <%= turbo_frame_tag 'like_count_photo_#{photo_id}' do %>
                        <%= button_to like_photo_path(#{photo_id},'true'),class: 'cardImg__right-footer__btn border-0 bg-transparent' do %>
                            <i class='heart-icon dislike fa-solid fa-heart'></i>
                            <span>#{photo_like_size}</span>
                        <%end%>
                    <%end%>
                    " ) 
        end
    end


    def update_like_album(album_id,album_like_size,is_like)
        

        if is_like == 'true'
            render turbo_stream:
                turbo_stream.replace("like_count_album_#{album_id}",
                    inline:  "
                    <%= turbo_frame_tag 'dislike_count_album_#{album_id}' do %>
                        <%= button_to like_album_path(#{album_id}, 'false'),class: 'cardImg__right-footer__btn border-0 bg-transparent' do %>
                            <i class='heart-icon like fa-solid fa-heart'></i>
                            <span>#{album_like_size}</span>
                        <%end%>
                    <%end%>
                    
                    " )
        elsif is_like =='false'
            render turbo_stream:
                turbo_stream.replace("dislike_count_album_#{album_id}",
                    inline:  "
                    <%= turbo_frame_tag 'like_count_album_#{album_id}' do %>
                        <%= button_to like_album_path(#{album_id},'true'),class: 'cardImg__right-footer__btn border-0 bg-transparent' do %>
                            <i class='heart-icon dislike fa-solid fa-heart'></i>
                            <span>#{album_like_size}</span>
                        <%end%>
                    <%end%>
                    " ) 
        end
    end


end