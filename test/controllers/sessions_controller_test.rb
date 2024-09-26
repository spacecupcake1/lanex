require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should create session with valid credentials" do
    user = users(:one)
    post login_url, params: { user_name: user.user_name, password: 'password' }
    assert_redirected_to root_url
    assert_equal user.id, session[:user_id]
  end

  test "should not create session with invalid credentials" do
    post login_url, params: { user_name: 'nonexistent', password: 'wrong' }
    assert_response :unprocessable_entity
    assert_nil session[:user_id]
  end

  test "should destroy session" do
    delete logout_url
    assert_redirected_to root_url
    assert_nil session[:user_id]
  end
end