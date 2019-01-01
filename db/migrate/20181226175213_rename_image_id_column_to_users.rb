class RenameImageIdColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :image_id, :avatar
  end
end
