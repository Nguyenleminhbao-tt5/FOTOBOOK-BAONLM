class AddUserToLikePhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :like_photos, :user, null: false, foreign_key: true
  end
end
