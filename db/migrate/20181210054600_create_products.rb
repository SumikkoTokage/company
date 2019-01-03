class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.string	:name
		t.integer	:price
		t.integer	:stock_number
		t.text		:body
		t.integer	:postage_id
		t.integer	:sale_status_id
		t.integer	:category_id
		t.datetime	:created_at
		t.datetime	:updated_at
		t.integer	:creator_id
		t.text		:photo

      t.timestamps
    end
  end
end
