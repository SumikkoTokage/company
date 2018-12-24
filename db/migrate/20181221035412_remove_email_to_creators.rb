class RemoveEmailToCreators < ActiveRecord::Migration[5.2]
  def change
  	remove_column :creators, :email, :string
  end
end
