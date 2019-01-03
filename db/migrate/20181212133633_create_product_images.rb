class CreateProductImages < ActiveRecord::Migration[5.2]
  def change
    create_table :product_images, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :product_id
      t.string :image_id

      t.timestamps
    end
  end
end
