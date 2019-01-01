class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
  	@user = User.find(current_user.id)
  	@product_favorites = current_user.product_favorites
    @post_favorites = current_user.post_favorites
    @shopping_bags = current_user.shopping_bags
    @creator = Creator.find_by(id: params[:id])
  end

  def resignation
  end

  def complete
    @user = current_user
    if @user.update(delete_flag:true)
      session.destroy
    end
  end

  def user_guide
  end

end

