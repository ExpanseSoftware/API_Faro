require 'test_helper'
require 'json'

class UsersControllerTest < ActionController::TestCase

  test "Should get valid list of users" do
    get :index
    assert_response :success
    assert_equal response.content_type, 'application/vnd.api+json'
    jdata = JSON.parse response.body
    assert_equal 6, jdata['data'].length
    assert_equal jdata['data'][0]['type'], 'users'
  end

  test "Should get valid user data" do
    user = users('user_1')
    get :show, params: { token: user.token }
    assert_response :success
    jdata = JSON.parse response.body
    assert_equal user.id.to_s, jdata['data']['id']
    assert_equal user.user_email, jdata['data']['attributes']['user-email']
    assert_equal user_url(user, { host: "localhost", port: 3000 }),
                 jdata['data']['links']['self']
  end

  test "Should get JSON:API error block when requesting user data with invalid ID" do
    get :show, params: { token: "z" }
    assert_response 404
    jdata = JSON.parse response.body
    assert_equal "Wrong token provided", jdata['errors'][0]['detail']
    assert_equal '/data/attributes/token', jdata['errors'][0]['source']['pointer']
  end

  test "Creating new user without sending correct content-type should result in error" do
    post :create, params: {}
    assert_response 406
  end

  test "Creating new user without sending X-Api-Key should result in error" do
    @request.headers["Content-Type"] = 'application/vnd.api+json'
    post :create, params: {}
    assert_response 403
  end

  test "Creating new user with incorrect X-Api-Key should result in error" do
    @request.headers["Content-Type"] = 'application/vnd.api+json'
    @request.headers["X-Api-Key"] = '0000'
    post :create, params: {}
    assert_response 403
  end

  test "Creating new user with invalid type in JSON data should result in error" do
    user = users('user_1')
    @request.headers["Content-Type"] = 'application/vnd.api+json'
    @request.headers["X-Api-Key"] = user.token
    post :create, params: { data: { type: 'posts' }}
    assert_response 409
  end

  test "Creating new user with invalid data should result in error" do
    user = users('user_1')
    @request.headers["Content-Type"] = 'application/vnd.api+json'
    @request.headers["X-Api-Key"] = user.token
    post :create, params: {
                    data: {
                      type: 'users',
                      attributes: {
                        user_name: nil,
                        user_lastname: nil,
                        user_email: nil,
                        password: nil,
                        password_confirmation: nil }}}
    assert_response 422
    jdata = JSON.parse response.body
    pointers = jdata['errors'].collect { |e|
      e['source']['pointer'].split('/').last
    }.sort
    assert_equal ['password','user-email','user-email','user-lastname','user-name'], pointers
  end

  test "Creating new user with valid data should create new user" do
    user = users('user_1')
    @request.headers["Content-Type"] = 'application/vnd.api+json'
    @request.headers["X-Api-Key"] = user.token
    post :create, params: {
                    data: {
                      type: 'users',
                      attributes: {
                        user_name: 'User Number7',
                        user_lastname: 'User Lastname7',
                        user_email: 'alexgunner2012@gmail.com',
                        password: 'password',
                        password_confirmation: 'password' }}}
    assert_response 201
    jdata = JSON.parse response.body
    assert_equal 'User Number7',
                 jdata['data']['attributes']['user-name']
  end

  test "Updating an existing user with valid data should update that user" do
    user = users('user_1')
    @request.headers["Content-Type"] = 'application/vnd.api+json'
    @request.headers["X-Api-Key"] = user.token
    patch :update, params: {
                     token: user.token,
                     data: {
                       id: user.id,
                       type: 'users',
                       attributes: { user_name: 'User Number1a' }}}
    assert_response 200
    jdata = JSON.parse response.body
    assert_equal 'User Number1a', jdata['data']['attributes']['user-name']
  end

  test "Should delete user" do
    user = users('user_1')
    ucount = User.count - 1
    @request.headers["X-Api-Key"] = user.token
    delete :destroy, params: { token: users('user_5').token }
    assert_response 204
    assert_equal ucount, User.count
  end
end
