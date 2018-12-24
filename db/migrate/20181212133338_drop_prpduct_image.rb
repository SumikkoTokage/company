class DropPrpductImage < ActiveRecord::Migration[5.2]
  def change
  	drop_table :prpduct_images
  end
end
