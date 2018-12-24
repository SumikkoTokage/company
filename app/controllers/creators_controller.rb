class CreatorsController < ApplicationController

  def creator_guide
  end
  def index
    @creators = Creator.all
  end

  def show
    #binding.pry
    @creator = Creator.find_by(id: params[:id])
    @products = @creator.products
    @posts = @creator.posts
    @user = current_user
  end

  def mypage
    @creator = Creator.find(current_creator.id)
    @bank_accounts = current_creator.bank_accounts
  end

  def edit
    @creator = Creator.find(current_creator.id)
  end

  def update
    @creator = Creator.find(current_creator.id)
    if @creator.update(update_creator_params)
      redirect_to creator_path(current_creator.id)
    else
      render :edit
    end
  end

  def resignation
  end

  def complete
  end

  private
  def creator_params
      params.require(:creator).permit(:name, :user_id, :telephone, :shop_name, :image, :description, :send_date_id,
        bank_accounts_attributes:[ :bank_code, :bank_name, :branch_code_id, :deposit_type_id, :number, :name ])
  end

  def update_creator_params
      params.require(:creator).permit(:name, :user_id, :telephone, :shop_name, :image, :description, :send_date_id, bank_accounts_attributes:[:_destroy, :id, :bank_code, :bank_name, :branch_code_id, :deposit_type_id, :number, :name ])
  end
end
