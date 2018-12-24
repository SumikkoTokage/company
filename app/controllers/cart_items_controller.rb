class CartItemsController < ApplicationController
	def create
  	#binding.pry
  	cart_item = CartItem.new
  	cart_item.shopping_cart_id = current_user.shopping_cart.id
  	cart_item.product_id = params[:cart_item][:product_id]
  	cart_item.quantity = 1
  	cart_item.save
  	redirect_to shopping_cart_path(current_user.shopping_cart.id)
  end

  def destroy
  	cart_item = CartItem.find(params[:id])
  	cart_item.destroy
  	redirect_to shopping_cart_path(current_user.shopping_cart.id)
  end

  def update
  	#binding.pry
  	@cart_item = CartItem.find(params[:id])
  	@cart_item.update(cart_item_params)
  	redirect_to shopping_cart_path(current_user.shopping_cart.id)
  end

  private
  def cart_item_params
  	params.require(:cart_item).permit(:product_id, :quantity, :shopping_cart_id)
  end
end
