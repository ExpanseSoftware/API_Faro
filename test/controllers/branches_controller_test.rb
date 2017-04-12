require 'test_helper'

class BranchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get branches_index_url
    assert_response :success
  end

  test "should get create" do
    get branches_create_url
    assert_response :success
  end

  test "should get update" do
    get branches_update_url
    assert_response :success
  end

  test "should get change_status" do
    get branches_change_status_url
    assert_response :success
  end

end
