class RenameAddressLinesId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :shopping_bags, :address_lines_id, :address_line_id
  end
end
