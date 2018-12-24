class ChangeDatatypeImageIdOfCreators < ActiveRecord::Migration[5.2]
  def change
  	change_column :creators, :image_id, :string
  end
end
