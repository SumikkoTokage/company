class RemovePostageIdToProdect < ActiveRecord::Migration[5.2]
  def change
  	remove_column :products, :postage_id, :integer
  end
end
