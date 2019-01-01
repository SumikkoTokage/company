class ProductImage < ApplicationRecord
	belongs_to :product, inverse_of: :product_images
 	mount_uploader :avatar, AvatarUploader
 	
end
