require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should have many bookings" do
    user = users(:one)
    assert_respond_to user, :bookings
  end

  test "should have many lessons" do
    user = users(:one)
    lesson = lessons(:one)
    user.lessons << lesson
    assert_includes user.lessons, lesson  # Test the association more robustly
  end

  test "should have many booked lessons through bookings" do
    user = User.new
    assert_respond_to user, :booked_lessons
  end 

  test "should validate email format" do
    invalid_user = User.new(email: "invalid-email")
    assert_not invalid_user.valid?
    assert_includes invalid_user.errors[:email], "is invalid"
  end

  test "should validate password length" do
    short_password_user = User.new(password: "12345")
    assert_not short_password_user.valid?
    assert_includes short_password_user.errors[:password], "is too short (minimum is 6 characters)"
  end

  test "should secure password" do
    user = User.new(user_name: "testuser", email: "test@example.com", password: "password123", password_confirmation: "password123")
    assert user.save
    assert_not_nil user.password_digest  # Ensure the password is being hashed
  end

  test "should have many activities" do
    user = users(:one)
    activity = activities(:one)
    user.activities << activity
    assert_includes user.activities, activity  # Test the association
  end
end
