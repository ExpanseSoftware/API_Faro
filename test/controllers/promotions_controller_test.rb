require 'test_helper'

class PromotionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get promotions_index_url
    assert_response :success
  end

  test "should get create" do
    get promotions_create_url
    assert_response :success
  end

  test "should get update" do
    get promotions_update_url
    assert_response :success
  end

end
