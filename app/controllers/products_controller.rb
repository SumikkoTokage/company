class ProductsController < ApplicationController
  def index
    @products = Product.where(sale_status_id: 0)
    @user = current_user
    @product_image = ProductImage.where(image_id: 0)
    @posts = Post.all
    @creator = Creator.find_by(id: params[:id])
  end

  def show
    @product = Product.find_by(id: params[:id])
    @product_images = ProductImage.where(product_id: params[:product_id])
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    @product.creator_id = current_creator.id
    @product.save
    redirect_to products_path
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.creator_id = current_creator.id
    @product.update(product_params)
    redirect_to products_path
  end

  def complete
  end

  def destroy
    product = Product.find_by(params[:id])
    product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock_number, :body, :sale_status_id, :category_id, :creator_id, :postage_list_id, :postage_price,  product_images_images: [])
  end

end
