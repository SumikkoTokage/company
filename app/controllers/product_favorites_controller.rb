class ProductFavoritesController < ApplicationController
	def create
		product_favorite = current_user.product_favorites.build(product_id: params[:product_id])
    	product_favorite.save
    	redirect_to user_path(current_user)
	end
	def destroy
		product_favorite = ProductFavorite.find_by(product_id: params[:product_id], user_id: current_user.id)
    	product_favorite.destroy
    	redirect_to root_path
	end
end	
