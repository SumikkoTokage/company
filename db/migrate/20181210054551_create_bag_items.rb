class CreateBagItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bag_items do |t|
    	t.integer	:product_id
		t.integer	:shopping_bag_id
		t.integer	:quantity
		t.integer	:purchase_price

      t.timestamps
    end
  end
end
