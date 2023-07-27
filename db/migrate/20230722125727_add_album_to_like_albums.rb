class AddAlbumToLikeAlbums < ActiveRecord::Migration[7.0]
  def change
    add_reference :like_albums, :album, null: false, foreign_key: true
  end
end

