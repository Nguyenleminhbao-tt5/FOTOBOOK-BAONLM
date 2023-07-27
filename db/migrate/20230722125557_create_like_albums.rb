class CreateLikeAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :like_albums do |t|

      t.timestamps
    end
  end
end
