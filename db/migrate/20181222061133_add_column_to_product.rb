class AddColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :postage_list_id, :integer
    add_column :products, :postage_price, :integer
  end
end
