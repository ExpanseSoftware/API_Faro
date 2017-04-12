require 'test_helper'

class BranchTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get branch_types_index_url
    assert_response :success
  end

  test "should get create" do
    get branch_types_create_url
    assert_response :success
  end

  test "should get update" do
    get branch_types_update_url
    assert_response :success
  end

end
