class CreateShoppingCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_carts do |t|
    	t.integer :user_id
      t.timestamps
    end
  end
end