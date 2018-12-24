class RemovePhotoFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :photo, :text
  end
end
