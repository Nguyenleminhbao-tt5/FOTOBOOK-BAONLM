class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :source

      t.timestamps
    end
  end
end
