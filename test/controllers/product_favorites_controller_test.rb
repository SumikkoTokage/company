require 'test_helper'

class ProductFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get product_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get product_favorites_destroy_url
    assert_response :success
  end

  test "should get index" do
    get product_favorites_index_url
    assert_response :success
  end

end
