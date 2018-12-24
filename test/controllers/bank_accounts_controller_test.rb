require 'test_helper'

class BankAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bank_accounts_index_url
    assert_response :success
  end

  test "should get new" do
    get bank_accounts_new_url
    assert_response :success
  end

  test "should get create" do
    get bank_accounts_create_url
    assert_response :success
  end

  test "should get edit" do
    get bank_accounts_edit_url
    assert_response :success
  end

  test "should get update" do
    get bank_accounts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get bank_accounts_destroy_url
    assert_response :success
  end

end
