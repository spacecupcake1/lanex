class StudentMailer < ApplicationMailer
  def lesson_booked(booking)
    @booking = booking
    @student = booking.user
    @lesson = booking.lesson
    @teacher = @lesson.user

    mail(to: @student.email, subject: "Lesson Booked: #{@lesson.title}")
  end
end