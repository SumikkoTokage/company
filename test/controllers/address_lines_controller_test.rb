require 'test_helper'

class AddressLinesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get address_lines_new_url
    assert_response :success
  end

  test "should get create" do
    get address_lines_create_url
    assert_response :success
  end

  test "should get edit" do
    get address_lines_edit_url
    assert_response :success
  end

  test "should get update" do
    get address_lines_update_url
    assert_response :success
  end

  test "should get destroy" do
    get address_lines_destroy_url
    assert_response :success
  end

  test "should get index" do
    get address_lines_index_url
    assert_response :success
  end

end
