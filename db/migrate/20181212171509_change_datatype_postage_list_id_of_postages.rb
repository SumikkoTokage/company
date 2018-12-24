class ChangeDatatypePostageListIdOfPostages < ActiveRecord::Migration[5.2]
  def change
  	change_column :postages, :postage_list_id, :integer
  end
end
