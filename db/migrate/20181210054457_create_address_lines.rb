class CreateAddressLines < ActiveRecord::Migration[5.2]
  def change
    create_table :address_lines, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.integer :user_id
		t.string :name
		t.string :postcode
		t.integer :prefecture_id
		t.string :city
		t.string :address
		t.datetime :created_at
		t.datetime :updated_at

      t.timestamps
    end
  end
end
