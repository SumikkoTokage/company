# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]


  # GET /resource/sign_up
  def new
    @user = User.new
    @user.address_lines.build
    yield resource if block_given?
    respond_with resource
  end

  # POST /resource
  def create
    super
    if user_signed_in?
      shopping_cart = ShoppingCart.new
      shopping_cart.user_id = current_user.id
      shopping_cart.save
    end
  end

  # GET /resource/edit
   def edit
     @user.avatar.cache! unless @user.avatar.blank?
     @user = User.find(current_user.id)
   end

  # PUT /resource

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,keys: [:nickname, :gender, :avatar, address_lines_attributes: [:id, :name, :postcode, :prefecture_id, :city, :address]])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update,keys: [:nickname, :gender, :avatar, address_lines_attributes: [:id, :name, :postcode, :prefecture_id, :city, :address]])
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
