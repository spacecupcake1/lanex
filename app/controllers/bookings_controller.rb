class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @booking = current_user.bookings.build(booking_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
