class CreateShoppingBags < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_bags do |t|
    	t.integer	:user_id
		t.integer	:address_lines_id
		t.datetime	:created_at
		t.datetime	:updated_at

      t.timestamps
    end
  end
end
