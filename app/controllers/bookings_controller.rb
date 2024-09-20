class BookingsController < ApplicationController
  before_action :ensure_authenticated
  before_action :ensure_student

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @booking = current_user.bookings.build(lesson: @lesson, booking_date: Date.today)
    
    if @booking.save
      # Send emails
      StudentMailer.lesson_booked(@booking).deliver_later
      TeacherMailer.new_student_enrolled(@booking).deliver_later
      
      redirect_to confirmation_booking_path(@booking)
    else
      redirect_to lesson_path(@lesson), alert: 'Unable to book the lesson.'
    end
  end

  def confirmation
    @booking = Booking.find(params[:id])
  end

  private

  def ensure_authenticated
    unless current_user
      redirect_to login_path, alert: 'You need to log in to book a lesson.'
    end
  end

  def ensure_student
    unless current_user && current_user.role == 'student'
      redirect_to root_path, alert: 'Only students can book lessons.'
    end
  end
end