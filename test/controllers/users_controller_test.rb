require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @other_user = users(:two)
  end

  test "should redirect index when not logged in" do
    get users_url
    assert_redirected_to login_url
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { user_name: 'newuser', email: 'new@example.com', password: 'password', password_confirmation: 'password' } }
    end

    assert_redirected_to login_url
  end

  test "should show user when logged in as that user" do
    login_as(@user)
    get user_url(@user)
    assert_response :success
  end

  test "should redirect show when not logged in as that user" do
    login_as(@other_user)
    get user_url(@user)
    assert_redirected_to root_url
  end

  test "should get edit when logged in as that user" do
    login_as(@user)
    get edit_user_url(@user)
    assert_response :success
  end

  test "should redirect edit when not logged in as that user" do
    login_as(@other_user)
    get edit_user_url(@user)
    assert_redirected_to root_url
  end

  test "should update user when logged in as that user" do
    login_as(@user)
    put user_url(@user), params: { user: { email: 'updated@example.com', password: 'newpassword', password_confirmation: 'newpassword' } }
    @user.reload
    assert_response :redirect
    assert_redirected_to user_url(@user)
    assert_equal 'updated@example.com', @user.email, "Email was not updated as expected"
  end

  test "should redirect update when not logged in as that user" do
    login_as(@other_user)
    patch user_url(@user), params: { user: { email: 'updated@example.com' } }
    assert_redirected_to root_url
    @user.reload
    assert_not_equal 'updated@example.com', @user.email
  end
  
end