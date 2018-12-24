class ProductImagesController < ApplicationController

	def new
		@product_image = ProductImage.new
	end

	def create
		@product_image = ProductImage.new(product_image_params)
		@product_image.save
	end

	def product_image_params
      params.require(:product_image).permit(:image, :product_id)
    end

end
