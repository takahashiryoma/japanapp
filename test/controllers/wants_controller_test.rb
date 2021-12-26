require "test_helper"

class WantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wants_index_url
    assert_response :success
  end

  test "should get show" do
    get wants_show_url
    assert_response :success
  end

  test "should get new" do
    get wants_new_url
    assert_response :success
  end

  test "should get create" do
    get wants_create_url
    assert_response :success
  end

  test "should get destroy" do
    get wants_destroy_url
    assert_response :success
  end
end
