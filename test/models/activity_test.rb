require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @trackable = users(:two)  # Using another user as trackable for this example
    @activity = Activity.new(user: @user, trackable: @trackable, action: "test")
  end

  test "should be valid" do
    assert @activity.valid?
  end

  test "should belong to user" do
    assert_respond_to @activity, :user
    assert_equal @user, @activity.user
  end

  test "should belong to trackable" do
    assert_respond_to @activity, :trackable
    assert_equal @trackable, @activity.trackable
  end

  test "should have polymorphic trackable" do
    assert_respond_to @activity, :trackable_type
    assert_equal "User", @activity.trackable_type
  end

  test "description should return correct string" do
    expected_description = "#{@user.user_name} testd a user"
    assert_equal expected_description, @activity.description
  end
end