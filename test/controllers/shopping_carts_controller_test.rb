require 'test_helper'

class ShoppingCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shopping_carts_show_url
    assert_response :success
  end

  test "should get pay" do
    get shopping_carts_pay_url
    assert_response :success
  end

  test "should get purchase" do
    get shopping_carts_purchase_url
    assert_response :success
  end

  test "should get complete" do
    get shopping_carts_complete_url
    assert_response :success
  end

end
