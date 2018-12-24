require 'test_helper'

class CreatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get creators_index_url
    assert_response :success
  end

  test "should get edit" do
    get creators_edit_url
    assert_response :success
  end

  test "should get update" do
    get creators_update_url
    assert_response :success
  end

  test "should get show" do
    get creators_show_url
    assert_response :success
  end

  test "should get resignation" do
    get creators_resignation_url
    assert_response :success
  end

  test "should get complete" do
    get creators_complete_url
    assert_response :success
  end

  test "should get creator_guide" do
    get creators_creator_guide_url
    assert_response :success
  end

end
