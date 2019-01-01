# frozen_string_literal: true

class Creators::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:cancel]
  #before_action :configure_sign_up_params, only: [:create]
  #before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @creator = Creator.new
    @creator.bank_accounts.build
    yield resource if block_given?
    respond_with resource
  end

  # POST /resource
  def create
    creator = Creator.new
    creator.name = params[:creator][:name]
    creator.user_id = current_user.id
    creator.telephone = params[:creator][:telephone]
    creator.shop_name = params[:creator][:shop_name]
    creator.avatar = params[:creator][:avatar]
    creator.description = params[:creator][:description]
    creator.send_date_id = params[:creator][:send_date_id]
    creator.password = params[:creator][:password]
    creator.password_confirmation = params[:creator][:password_confirmation]
    creator.save
    bank_account = BankAccount.new
    bank_account.id = params[:bank_account][:id]
    bank_account.bank_code = params[:bank_account][:bank_code]
    bank_account.bank_name = params[:bank_account][:bank_name]
    bank_account.branch_code_id = params[:bank_account][:branch_code_id]
    bank_account.deposit_type_id = params[:bank_account][:deposit_type_id]
    bank_account.number = params[:bank_account][:number]
    bank_account.name = params[:bank_account][:name]
    bank_account.creator_id = creator.id
    bank_account.save

    # build_resource(configure_sign_up_params)
    # resource.user_id = current_user.id
    # binding.pry
    resource = creator
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      redirect_to creator_guide_path
    end
  end

  # GET /resource/edit
   def edit
     @creator.avatar.cache! unless @creator.avatar.blank?
     super
   end

  # PUT /resource
  # def update
  #   super
  # end

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

  #protected

  #def configure_sign_up_params
  #  devise_parameter_sanitizer.permit(:sign_up, keys: [:user_id, :name, :telephone, :shop_name, :avatar, :description, :send_date_id, :bank_accounts_attributes => [ :id, :bank_code, :bank_name, :branch_code_id, :deposit_type_id, :number, :name]])
  #end

  #def configure_account_update_params
  #  devise_parameter_sanitizer.permit(:account_update, keys: [:user_id, :name, :telephone, :shop_name, :avatar, :description, :send_date_id, :bank_accounts_attributes => [ :id, :bank_code, :bank_name, :branch_code_id, :deposit_type_id, :number, :name]])
  #end

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
