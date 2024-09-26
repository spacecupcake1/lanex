class TeacherMailer < ApplicationMailer
  def new_student_enrolled(booking)
    @booking = booking
    @student = booking.user
    @lesson = booking.lesson
    @teacher = @lesson.user

    mail(to: @teacher.email, subject: "New Student Enrolled: #{@lesson.title}")
  end
end