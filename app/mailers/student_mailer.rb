class StudentMailer < ApplicationMailer
  def lesson_booked(booking)
    Rails.logger.debug "SMTP settings: #{ActionMailer::Base.smtp_settings.inspect}"
    
    @booking = booking
    @student = booking.user
    @lesson = booking.lesson
    @teacher = @lesson.user

    Rails.logger.debug "Email details: To: #{@student.email}, Lesson: #{@lesson.title}, Teacher: #{@teacher.full_name}"

    mail_result = mail(to: @student.email, subject: "Lesson Booked: #{@lesson.title}")
    
    Rails.logger.debug "Email prepared. Mail object: #{mail_result.inspect}"
    
    mail_result
  end
end