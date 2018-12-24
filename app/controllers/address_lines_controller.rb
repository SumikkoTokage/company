class AddressLinesController < ApplicationController
  def new
    @address_line = AddressLine.new
  end

  def create
    address_line = AddressLine.new(address_line_params)
    address_line.user_id = current_user.id
    address_line.save
    redirect_to address_lines_path
  end

  def edit
    @address_line = AddressLine.find(params[:id])
  end

  def update
    @address_line = AddressLine.find(params[:id])
    @address_line.user_id = current_user.id
    @address_line.update(address_line_params)
    redirect_to address_lines_path
  end

  def destroy
    address_line = AddressLine.find(params[:id])
    address_line.destroy
    redirect_to address_lines_path
  end

  def index
    @address_lines = current_user.address_lines
    @shopping_cart_id = current_user.shopping_cart.id
  end

  private
  def address_line_params
    params.require(:address_line).permit(:postcode, :prefecture_id, :address, :city, :_destroy, :id, :name )
  end
end
