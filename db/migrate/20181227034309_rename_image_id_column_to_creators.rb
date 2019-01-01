class RenameImageIdColumnToCreators < ActiveRecord::Migration[5.2]
  def change
  	rename_column :creators, :image_id, :avatar
  end
end
