require 'test_helper'

class CompanyTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_types_index_url
    assert_response :success
  end

  test "should get create" do
    get company_types_create_url
    assert_response :success
  end

  test "should get update" do
    get company_types_update_url
    assert_response :success
  end

end
