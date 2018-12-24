class RenamePhotoColumnToPosts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :posts, :photo, :image_id
  end
end
