class RemoveAddressLinesIdToCreators < ActiveRecord::Migration[5.2]
  def change
  	remove_column :creators, :address_lines_id, :integer
  end
end
