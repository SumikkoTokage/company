class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer	:bag_item_id
		t.integer	:order_status_id
		t.integer	:delivery_status_id
		t.integer	:creator_id

      t.timestamps
    end
  end
end
