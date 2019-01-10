class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :update]
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

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  protected

  def user_params
    params.require(:user).permit(:account_update,keys: [:nickname, :gender, :avatar, address_lines_attributes: [:id, :name, :postcode, :prefecture_id, :city, :address]])
  end


end



