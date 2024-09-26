require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should have many bookings" do
    user = User.new
    assert_respond_to user, :bookings
  end

  test "should have many lessons" do
    user = User.new
    assert_respond_to user, :lessons
  end

  test "should have many booked lessons through bookings" do
    user = User.new
    assert_respond_to user, :booked_lessons
  end

  test "should validate presence of user_name" do
    user = User.new
    assert_not user.valid?
    assert_includes user.errors[:user_name], "can't be blank"
  end

  test "should validate uniqueness of user_name" do
    existing_user = users(:one)
    user = User.new(user_name: existing_user.user_name)
    assert_not user.valid?
    assert_includes user.errors[:user_name], "has already been taken"
  end

  test "should validate presence of email" do
    user = User.new
    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test "should validate uniqueness of email" do
    existing_user = users(:one)
    user = User.new(email: existing_user.email)
    assert_not user.valid?
    assert_includes user.errors[:email], "has already been taken"
  end

  test "should validate presence of password" do
    user = User.new
    assert_not user.valid?
    assert_includes user.errors[:password], "can't be blank"
  end

  test "should validate minimum length of password" do
    user = User.new(password: "short")
    assert_not user.valid?
    assert_includes user.errors[:password], "is too short (minimum is 6 characters)"
  end

  test "should return full name" do
    user = users(:one)
    expected_full_name = "#{user.first_name} #{user.last_name}"
    assert_equal expected_full_name, user.full_name
  end

  test "should return true for teacher?" do
    user = users(:teacher)
    assert user.teacher?
  end

  test "should return false for teacher? when not a teacher" do
    user = users(:student)
    assert_not user.teacher?
  end

  test "should return true for student?" do
    user = users(:student)
    assert user.student?
  end

  test "should return false for student? when not a student" do
    user = users(:teacher)
    assert_not user.student?
  end
end