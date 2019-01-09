class ProductsController < ApplicationController
  def index
    @products = Product.where(sale_status_id: 0)
    @user = current_user
    @posts = Post.all
    @creator = Creator.find_by(id: params[:id])
  end

  def show
    #binding.pry
    @product = Product.find(params[:id])
    @product_images = ProductImage.where(product_id: params[:product_id])
  end

  def new
    @product = Product.new
    5.times { @product.product_images.build }
  end

  def create
    @product = Product.new(product_params)
    @product.creator_id = current_creator.id
    @product.save
    redirect_to products_path
  end

  def edit
    #binding.pry
    @product = Product.find(params[:id])
    count = @product.product_images.count
    (5 - count).times{ @product.product_images.build }

  end

  def update
    @product = Product.find(params[:id])
    @product.creator_id = current_creator.id
    @product.update_attributes(product_params)
    render 'show'
  end

  def complete
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path
  end

  def goods
    @product_badges = Product.where(category_id: 0)
    @product_tapes = Product.where(category_id: 1)
    @product_cups = Product.where(category_id: 2)
    @product_bugs = Product.where(category_id: 3)
    @product_keyholders = Product.where(category_id: 4)
    @product_postcards = Product.where(category_id: 5)
  end

  def fashion
    @product_shirts = Product.where(category_id: 6)
    @product_earringss = Product.where(category_id: 7)
    @product_piercings = Product.where(category_id: 8)
    @product_necklaces = Product.where(category_id: 9)
  end

  def stationery
    @product_notes = Product.where(category_id: 10)
    @product_files = Product.where(category_id: 11)
    @product_pencases = Product.where(category_id: 12)
    @product_pens = Product.where(category_id: 13)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock_number, :body, :sale_status_id, :category_id, :creator_id, :postage_list_id, :postage_price, product_images_attributes: [:id, :avatar, :_destory])
  end

end
