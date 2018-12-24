class BankAccountsController < ApplicationController
  def index
    @bank_accounts = current_creator.bank_accounts
    @creator = current_creator
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    bank_account = BankAccount.new(bank_account_params)
    bank_account.creator_id = current_creator.id
    bank_account.save
    redirect_to bank_accounts_path
  end

  def edit
    @bank_account = BankAccount.find(params[:id])
  end

  def update
    @bank_account = BankAccount.find(params[:id])
    @bank_account.creator_id = current_creator.id
    @bank_account.update(bank_account_params)
    redirect_to bank_accounts_path
  end

  def destroy
    bank_account = BankAccount.find(params[:id])
    bank_account.destroy
    redirect_to bank_accounts_path
  end

  private
  def bank_account_params
    params.require(:bank_account).permit(:bank_code, :bank_name, :branch_code_id, :deposit_type_id, :_destroy, :id, :number, :name )
  end
end
