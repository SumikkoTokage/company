class PostFavoritesController < ApplicationController
  def create
  	post = Post.find(params[:post_id])
    favorite = current_user.post_favorites.new(post_id: post.id)
    favorite.save
    redirect_to root_path
  end

  def destroy
  	post = Post.find(params[:post_id])
    favorite = current_user.post_favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to root_path
  end

  def index
  end
end
