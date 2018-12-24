require 'test_helper'

class PostFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get post_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get post_favorites_destroy_url
    assert_response :success
  end

  test "should get index" do
    get post_favorites_index_url
    assert_response :success
  end

end
