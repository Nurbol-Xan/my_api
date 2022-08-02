class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.bigint :albumId
      t.string :title
      t.string :url
      t.string :thumbnailUrl
      
      #t.timestamps
    end
  end
end
