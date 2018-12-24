require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

  test "should get resignation" do
    get users_resignation_url
    assert_response :success
  end

  test "should get complete" do
    get users_complete_url
    assert_response :success
  end

  test "should get user_guide" do
    get users_user_guide_url
    assert_response :success
  end

end
