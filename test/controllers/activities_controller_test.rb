require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @activity = activities(:one)
  end

  test "should get index" do
    get activities_url
    assert_response :success
    assert_not_nil assigns(:activities)
  end

  test "should paginate activities" do
    # Create more than 20 activities to test pagination
    25.times do |i|
      Activity.create(user: @user, trackable: @user, action: "test_action_#{i}")
    end

    get activities_url
    assert_response :success
    assert_equal 20, assigns(:activities).size
  end

  test "should order activities by created_at desc" do
    get activities_url
    assert_response :success
    activities = assigns(:activities)
    assert_equal activities.order(created_at: :desc), activities
  end

  test "should include user and trackable" do
    get activities_url
    assert_response :success
    activities = assigns(:activities)
    activities.each do |activity|
      assert_not_nil activity.user
      assert_not_nil activity.trackable
    end
  end
end