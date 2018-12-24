class RenameNameColumnToPostages < ActiveRecord::Migration[5.2]
  def change
  	rename_column :postages, :name, :postage_list_id
  end
end
