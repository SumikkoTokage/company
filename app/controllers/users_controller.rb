class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:complete,:guide]
  def show
  	@user = User.find(current_user.id)
  	@product_favorites = current_user.product_favorites
    @post_favorites = current_user.post_favorites
    @shopping_bags = current_user.shopping_bags
    @creator = Creator.find_by(id: params[:id])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(update_user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
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

  private
  def user_params
      params.require(:user).permit(:nickname, :email, :gender, :image, address_lines_attributes:[:name, :postcode, :prefecture_id,:city,:address])
  end

  def update_user_params
      params.require(:user).permit(:nickname, :email, :gender, :image, address_lines_attributes:[:_destroy, :id, :name, :postcode, :prefecture_id,:city,:address])
  end

end
