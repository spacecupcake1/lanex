require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  test "should belong to user" do
    booking = Booking.new
    assert_respond_to booking, :user
  end

  test "should belong to lesson" do
    booking = Booking.new
    assert_respond_to booking, :lesson
  end
end