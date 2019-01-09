class ShoppingCartsController < ApplicationController
  def show
	  	@shopping_cart = current_user.shopping_cart
	  	@cart_items = current_user.shopping_cart.cart_items
	  	@address_lines = current_user.address_lines
  	end
  	def pay
  		
  	end

  	def purchase
  		@shopping_cart = current_user.shopping_cart
  		@shopping_cart_id = current_user.shopping_cart.id
 	  	@cart_items = current_user.shopping_cart.cart_items
 	  	@address_line = AddressLine.find(params[:address_line][:address_line_id])
 	  	@address_line_id = @address_line.id
  	end
  	def complete
  		shopping_bag = ShoppingBag.new
  		shopping_bag.user_id = current_user.id
  		shopping_bag.address_lines_id = params[:shopping_bag][:address_line_id]
  		shopping_bag.save
  		shopping_cart = current_user.shopping_cart
  		cart_items = current_user.shopping_cart.cart_items
  		shopping_cart.cart_items.each do |cart_item|
	  		bag_item = BagItem.new
	  		bag_item.id = cart_item.id
	  		bag_item.shopping_bag_id = shopping_bag.id
	  		bag_item.product_id = cart_item.product_id
	  		bag_item.delivery_status_id = 1
	  		bag_item.quantity = cart_item.quantity
	  		bag_item.purchase_price = cart_item.product.price
	  		delete_flag = false
	  		bag_item.save
	  		cart_item.destroy
	  	end
  	end

  	private
  	def complete_params
  		params.require(:cart_item).permit(:product_id, :quantity, :shopping_cart_id)
  		params.require(:address_line).permit(:id, :user_id, :name, :postcode, :prefecture_id, :city, :address)
  	end
end
