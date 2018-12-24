class AddproductIdToPostages < ActiveRecord::Migration[5.2]
  def change
  	 add_column :postages, :product_id, :integer
  end
end
