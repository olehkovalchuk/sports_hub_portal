require "test_helper"

class BanerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get baner_index_url
    assert_response :success
  end

  test "should get new" do
    get baner_new_url
    assert_response :success
  end

  test "should get create" do
    get baner_create_url
    assert_response :success
  end

  test "should get show" do
    get baner_show_url
    assert_response :success
  end

  test "should get edit" do
    get baner_edit_url
    assert_response :success
  end

  test "should get update" do
    get baner_update_url
    assert_response :success
  end

  test "should get destroy" do
    get baner_destroy_url
    assert_response :success
  end
end
