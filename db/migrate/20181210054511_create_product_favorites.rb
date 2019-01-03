class CreateProductFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :product_favorites, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.integer	:user_id
		t.integer	:product_id
      t.timestamps
    end
  end
end
