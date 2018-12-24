require 'test_helper'

class ShoppingBagsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shopping_bags_create_url
    assert_response :success
  end

end
