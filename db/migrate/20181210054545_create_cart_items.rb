class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.integer	:product_id
		t.integer	:shopping_cart_id
		t.integer	:quantity
      t.timestamps
    end
  end
end
