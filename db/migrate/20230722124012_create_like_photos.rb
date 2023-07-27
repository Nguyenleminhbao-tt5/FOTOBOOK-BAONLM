class CreateLikePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :like_photos do |t|

      t.timestamps
    end
  end
end
