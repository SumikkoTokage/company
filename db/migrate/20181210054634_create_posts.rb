class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.text		:body
		t.integer	:creator_id
		t.datetime	:created_at
		t.datetime	:updated_at
		t.text		:photo

      t.timestamps
    end
  end
end
