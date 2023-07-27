class AddPhotoToLikePhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :like_photos, :photo, null: false, foreign_key: true
  end
end
