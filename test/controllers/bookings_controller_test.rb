require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = users(:student)
    @lesson = lessons(:one)
    login_as(@student)
  end

  test "should create booking" do
    assert_difference('Booking.count') do
      post bookings_url, params: { lesson_id: @lesson.id }
    end

    assert_redirected_to confirmation_booking_url(Booking.last)
  end

  test "should get confirmation" do
    booking = bookings(:one)
    get confirmation_booking_url(booking)
    assert_response :success
  end
end