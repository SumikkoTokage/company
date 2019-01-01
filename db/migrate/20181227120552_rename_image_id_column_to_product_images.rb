class RenameImageIdColumnToProductImages < ActiveRecord::Migration[5.2]
  def change
  	rename_column :product_images, :image_id, :avatar
  end
end
